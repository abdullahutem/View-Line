import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/constants/app_strings.dart';
import 'package:view_line/core/data/mock_data.dart';
import 'package:view_line/core/localization/cubit/language_cubit.dart';
import 'package:view_line/core/localization/cubit/language_state.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/home/cubit/home_cubit.dart';
import 'package:view_line/features/home/presentation/screens/main_service_details_screen.dart';
import 'package:view_line/features/home/presentation/widgets/achievements_section.dart';
import 'package:view_line/features/home/presentation/widgets/ad_carousel.dart';
import 'package:view_line/features/home/presentation/widgets/customer_reviews_section.dart';
import 'package:view_line/features/home/presentation/widgets/main_service_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..loadAdvertisements(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            // Language Button with Bottom Sheet
            Container(
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, state) {
                  return IconButton(
                    icon: const Icon(Icons.language, color: Colors.white),
                    tooltip: context.isArabic ? 'اللغة' : 'Language',
                    onPressed: () {
                      _showLanguageBottomSheet(context);
                    },
                  );
                },
              ),
            ),
          ],
          title: Row(
            children: [
              Icon(Icons.flight_takeoff, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                context.isArabic ? AppStrings.appNameAr : AppStrings.appNameEn,
              ),
            ],
          ),
          centerTitle: false,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: AppColors.error),
                ),
              );
            }

            if (state is HomeLoaded) {
              final mainServices = MockData.getMainServices(); // Add this

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: context.isArabic
                              ? AppStrings.searchHintAr
                              : AppStrings.searchHintEn,
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.tune),
                            onPressed: () {
                              // Add filter functionality
                            },
                          ),
                        ),
                        onChanged: (value) {
                          // Add search functionality
                        },
                      ),
                    ),

                    // Advertisement Carousel
                    const SizedBox(height: 8),
                    AdCarousel(advertisements: state.advertisements),

                    const SizedBox(height: 32),

                    // OUR MAIN SERVICES SECTION - NEW
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        context.isArabic ? 'خدماتنا' : 'Our Services',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        context.isArabic
                            ? 'اكتشف حلول السفر الشاملة لدينا'
                            : 'Discover our comprehensive travel solutions',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Main Services Grid
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.69,
                            ),
                        itemCount: mainServices.length,
                        itemBuilder: (context, index) {
                          final service = mainServices[index];
                          return MainServiceCard(
                            service: service,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MainServiceDetailsScreen(
                                    service: service,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ACHIEVEMENTS IN NUMBERS SECTION - NEW
                    const AchievementsSection(),
                    const SizedBox(height: 32),
                    const CustomerReviewsSection(),

                    const SizedBox(height: 32),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<LanguageCubit>(),
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              final languageCubit = context.read<LanguageCubit>();

              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      languageCubit.isArabic ? 'اختر اللغة' : 'Select Language',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Arabic Option
                    ListTile(
                      leading: const Icon(Icons.language, color: Colors.green),
                      title: const Text(
                        'العربية',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: const Text('Arabic'),
                      trailing: languageCubit.isArabic
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : null,
                      onTap: () {
                        languageCubit.changeLanguage('ar');
                        Navigator.pop(bottomSheetContext);
                        Phoenix.rebirth(context);
                      },
                    ),

                    const Divider(),

                    // English Option
                    ListTile(
                      leading: const Icon(Icons.language, color: Colors.blue),
                      title: const Text(
                        'English',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: const Text('الإنجليزية'),
                      trailing: languageCubit.isEnglish
                          ? const Icon(Icons.check_circle, color: Colors.blue)
                          : null,
                      onTap: () {
                        languageCubit.changeLanguage('en');
                        Navigator.pop(bottomSheetContext);
                        Phoenix.rebirth(context);
                      },
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
