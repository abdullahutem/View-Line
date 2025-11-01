import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/cache/cache_helper.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/database/api/end_points.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/auth/presentation/screens/login_screen.dart';
import 'package:view_line/features/logout/cubit/logout_cubit.dart';
import 'package:view_line/features/main_page/presentation/screens/main_page.dart';
import 'package:view_line/features/transactions/presentation/cubit/transactions_cubit.dart';
import 'package:view_line/features/transactions/presentation/widgets/transactions_card.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _passportController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _passportController.dispose();
    super.dispose();
  }

  void _onPopInvoked(bool didPop, dynamic result) async {
    if (didPop) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<LogoutCubit>().getLogout();
      });
      final token = CacheHelper().getDataString(key: ApiKey.token);
      print("=============token1==================$token");
      await CacheHelper().removeData(key: ApiKey.token);

      print("=============token==================$token");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutLoaded) {
          // Navigate to login screen or handle success
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
            (route) => false, // Remove all routes
          );
        } else if (state is LogoutError) {
          // Show error message
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: PopScope(
        canPop: true,
        onPopInvokedWithResult: _onPopInvoked,
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            title: Text(
              context.isArabic ? "المعاملات" : "Transactions",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
          body: Column(
            children: [
              // Search Card Section
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      Icons.search,
                                      color: AppColors.primary,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          context.isArabic
                                              ? "بحث في المعاملات"
                                              : "Search Transactions",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          context.isArabic
                                              ? "أدخل رقم جواز سفرك"
                                              : "Enter your passport number",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _passportController,
                                textCapitalization:
                                    TextCapitalization.characters,
                                textDirection: context.isArabic
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                decoration: InputDecoration(
                                  labelText: context.isArabic
                                      ? "رقم الجواز"
                                      : "Passport Number",
                                  hintText: context.isArabic
                                      ? "مثال: A1234567"
                                      : "e.g., A1234567",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: AppColors.primary,
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.assignment_ind_outlined,
                                    color: AppColors.primary,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade50,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.isArabic
                                        ? 'يرجى إدخال رقم جواز السفر'
                                        : 'Please enter your passport number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              BlocConsumer<
                                TransactionsCubit,
                                TransactionsState
                              >(
                                listener: (context, state) {
                                  if (state is TransactionsError) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Row(
                                          children: [
                                            const Icon(
                                              Icons.error_outline,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Text(state.message),
                                            ),
                                          ],
                                        ),
                                        backgroundColor: Colors.red.shade400,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  final isLoading =
                                      state is TransactionsLoading;

                                  return SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: isLoading
                                          ? null
                                          : () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                context
                                                    .read<TransactionsCubit>()
                                                    .eitherFailureOrTransactions(
                                                      _passportController.text
                                                          .trim(),
                                                    );
                                              }
                                            },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: Colors.white,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        disabledBackgroundColor: AppColors
                                            .primary
                                            .withOpacity(0.6),
                                      ),
                                      child: isLoading
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                      Color
                                                    >(Colors.white),
                                              ),
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.search, size: 20),
                                                const SizedBox(width: 8),
                                                Text(
                                                  context.isArabic
                                                      ? "بحث في المعاملات"
                                                      : "Search Transactions",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Results Section
              Expanded(
                child: BlocBuilder<TransactionsCubit, TransactionsState>(
                  builder: (context, state) {
                    if (state is TransactionsLoading) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(color: AppColors.primary),
                            const SizedBox(height: 16),
                            Text(
                              context.isArabic
                                  ? "جاري تحميل المعاملات..."
                                  : "Loading transactions...",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is TransactionsLoaded) {
                      if (state.transactionsEntities.data.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.receipt_long_outlined,
                                  size: 64,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                context.isArabic
                                    ? "لم يتم العثور على معاملات"
                                    : "No transactions found",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                context.isArabic
                                    ? "حاول البحث باستخدام رقم جواز سفر مختلف"
                                    : "Try searching with a different passport number",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                            child: Row(
                              children: [
                                Text(
                                  context.isArabic
                                      ? "${state.transactionsEntities.data.length} ${state.transactionsEntities.data.length == 1 ? 'معاملة' : 'معاملة'}"
                                      : "${state.transactionsEntities.data.length} Transaction${state.transactionsEntities.data.length == 1 ? '' : 's'} Found",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        size: 16,
                                        color: AppColors.primary,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        context.isArabic
                                            ? "تم التحقق"
                                            : "Verified",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              itemCount: state.transactionsEntities.data.length,
                              itemBuilder: (context, index) {
                                final transaction =
                                    state.transactionsEntities.data[index];
                                return FadeTransition(
                                  opacity: _fadeAnimation,
                                  child: TransactionCard(
                                    transaction: transaction,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }

                    if (state is TransactionsError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.error_outline,
                                size: 64,
                                color: Colors.red.shade400,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              context.isArabic
                                  ? "عذراً! حدث خطأ ما"
                                  : "Oops! Something went wrong",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                              ),
                              child: Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton.icon(
                              onPressed: () {
                                if (_passportController.text.isNotEmpty) {
                                  context
                                      .read<TransactionsCubit>()
                                      .eitherFailureOrTransactions(
                                        _passportController.text.trim(),
                                      );
                                }
                              },
                              icon: const Icon(Icons.refresh),
                              label: Text(
                                context.isArabic
                                    ? "حاول مرة أخرى"
                                    : "Try Again",
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    // Initial state - show welcome message
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.receipt_long,
                              size: 64,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            context.isArabic ? "جاهز للبحث" : "Ready to search",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            context.isArabic
                                ? "أدخل رقم الجواز أعلاه لعرض المعاملات"
                                : "Enter a passport number above to view transactions",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
