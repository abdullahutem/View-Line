import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:view_line/features/transactions/presentation/screens/transactions_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Create controllers here in the State
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: AppColors.primary.withOpacity(0.1)),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoaded) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TransactionsScreen()),
              );
            } else if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withOpacity(0.1),
                  AppColors.secondary.withOpacity(0.1),
                ],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Logo
                            Image.asset("assets/images/logo.jpeg"),
                            const SizedBox(height: 32),
                            Text(
                              context.isArabic ? "ڤيو لاين" : 'View line',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              context.isArabic
                                  ? 'رحلتك تبدأ من هنا'
                                  : 'Your Journey Starts Here',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textSecondary,
                              ),
                            ),

                            const SizedBox(height: 48),

                            // Login Card
                            Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.isArabic
                                        ? 'مرحباً بعودتك!'
                                        : 'Welcome Back!',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    context.isArabic
                                        ? 'سجل الدخول لمواصلة رحلتك'
                                        : 'Login to continue your journey',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),

                                  const SizedBox(height: 32),

                                  // Email Field
                                  TextFormField(
                                    controller:
                                        _emailController, // Use local controller
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: context.isArabic
                                          ? 'البريد الإلكتروني'
                                          : 'Email',
                                      hintText: context.isArabic
                                          ? 'أدخل بريدك الإلكتروني'
                                          : 'Enter your email',
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return context.isArabic
                                            ? "الرجاء إدخال البريد الإلكتروني"
                                            : "Please enter your email";
                                      }
                                      return null;
                                    },
                                  ),

                                  const SizedBox(height: 20),

                                  // Password Field
                                  TextFormField(
                                    controller:
                                        _passwordController, // Use local controller
                                    obscureText: _obscurePassword,
                                    decoration: InputDecoration(
                                      labelText: context.isArabic
                                          ? 'كلمة المرور'
                                          : 'Password',
                                      hintText: context.isArabic
                                          ? 'أدخل كلمة المرور'
                                          : 'Enter your password',
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: AppColors.primary,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscurePassword
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: AppColors.textSecondary,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscurePassword =
                                                !_obscurePassword;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return context.isArabic
                                            ? "الرجاء إدخال كلمة المرور"
                                            : "Please enter your password";
                                      }
                                      return null;
                                    },
                                  ),

                                  const SizedBox(height: 50),

                                  // Login Button
                                  BlocBuilder<AuthCubit, AuthState>(
                                    builder: (context, state) {
                                      final isLoading = state is AuthLoading;

                                      return SizedBox(
                                        width: double.infinity,
                                        height: 56,
                                        child: ElevatedButton(
                                          onPressed: isLoading
                                              ? null
                                              : () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    // Pass the values directly to the cubit
                                                    context
                                                        .read<AuthCubit>()
                                                        .login(
                                                          _emailController.text
                                                              .trim(),
                                                          _passwordController
                                                              .text
                                                              .trim(),
                                                        );
                                                  }
                                                },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
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
                                              : Text(
                                                  context.isArabic
                                                      ? "تسجيل الدخول"
                                                      : 'Login',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 24),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
