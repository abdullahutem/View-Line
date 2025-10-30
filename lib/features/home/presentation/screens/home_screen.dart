import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/constants/app_strings.dart';
import 'package:view_line/core/localization/cubit/language_cubit.dart';
import 'package:view_line/core/localization/cubit/language_state.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/auth/presentation/screens/login_screen.dart';
import 'package:view_line/features/home/data/models/sub_models/home_section.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/home_section_entities.dart';
import 'package:view_line/features/home/presentation/cubit/home_cubit.dart';
import 'package:view_line/features/home/presentation/widgets/achievements_section.dart';
import 'package:view_line/features/home/presentation/widgets/ad_carousel.dart';
import 'package:view_line/features/home/presentation/widgets/assurance_section.dart';
import 'package:view_line/features/home/presentation/widgets/contact_section.dart';
import 'package:view_line/features/home/presentation/widgets/features_section.dart';
import 'package:view_line/features/home/presentation/widgets/mobile_app_section.dart';
import 'package:view_line/features/home/presentation/widgets/qualifications_section.dart';
import 'package:view_line/features/home/presentation/widgets/testimonials_section.dart';
import 'package:view_line/features/home/presentation/widgets/top_destinations_section.dart';
import 'package:view_line/features/services/presentation/cubit/services_cubit.dart';
import 'package:view_line/features/services/presentation/widgets/service_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(Icons.abc_outlined),
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
            final List<HomeSectionEntities> sections = state.response.data;

            final heroSection = sections.firstWhere(
              (s) => s.sectionKey == 'hero',
              orElse: () => HomeSection(
                id: 0,
                sectionKey: '',
                displayOrder: 0,
                isActive: false,
              ),
            );

            final featuresSection = sections.firstWhere(
              (s) => s.sectionKey == 'features',
              orElse: () => HomeSection(
                id: 0,
                sectionKey: '',
                displayOrder: 0,
                isActive: false,
              ),
            );
            final topDestinationsSection = sections.firstWhere(
              (s) => s.sectionKey == 'gallery',
              orElse: () => HomeSection(
                id: 0,
                sectionKey: '',
                displayOrder: 0,
                isActive: false,
              ),
            );
            final testimonialsSection = sections.firstWhere(
              (s) => s.sectionKey == 'testimonials',
              orElse: () => HomeSection(
                id: 0,
                sectionKey: '',
                displayOrder: 0,
                isActive: false,
              ),
            );
            final achievementsSection = sections.firstWhere(
              (s) => s.sectionKey == 'stats',
              orElse: () => HomeSection(
                id: 0,
                sectionKey: '',
                displayOrder: 0,
                isActive: false,
              ),
            );
            final qualificationsSection = sections.firstWhere(
              (s) => s.sectionKey == 'qualifications',
              orElse: () => HomeSection(
                id: 0,
                sectionKey: '',
                displayOrder: 0,
                isActive: false,
              ),
            );
            final assuranceSection = sections.firstWhere(
              (s) => s.sectionKey == 'assurance',
              orElse: () => HomeSection(
                id: 0,
                sectionKey: '',
                displayOrder: 0,
                isActive: false,
              ),
            );
            final contactSection = sections.firstWhere(
              (s) => s.sectionKey == 'contact',
              orElse: () => HomeSection(
                id: 0,
                sectionKey: '',
                displayOrder: 0,
                isActive: false,
              ),
            );
            final mobileAppSection = sections.firstWhere(
              (s) => s.sectionKey == 'mobile_app',
              orElse: () => HomeSection(
                id: 0,
                sectionKey: '',
                displayOrder: 0,
                isActive: false,
              ),
            );
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
                      ),
                      onChanged: (value) {
                        // Add search functionality
                      },
                    ),
                  ),

                  // Advertisement Carousel
                  const SizedBox(height: 8),
                  AdCarousel(advertisements: heroSection.slides ?? []),

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
                  BlocBuilder<ServicesCubit, ServicesState>(
                    builder: (context, state) {
                      if (state is ServicesLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ServicesError) {
                        return Center(child: Text(state.message));
                      } else if (state is ServicesLoaded) {
                        final services = state.services;
                        if (services.isEmpty) {
                          return Center(
                            child: Text(
                              context.isArabic
                                  ? 'لا توجد خدمات متاحة حالياً'
                                  : 'No services available currently',
                            ),
                          );
                        }
                        return SizedBox(
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 1.2,
                                  ),
                              itemCount: services.length,
                              itemBuilder: (context, index) {
                                final service = services[index];
                                return ServiceCard(
                                  service: service,
                                  onTap: () {},
                                );
                              },
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  const SizedBox(height: 32),
                  FeaturesSection(section: featuresSection),

                  const SizedBox(height: 32),
                  TopDestinationsSection(section: topDestinationsSection),

                  // const CustomerReviewsSection(),
                  const SizedBox(height: 32),
                  TestimonialsSection(section: testimonialsSection),
                  // const CustomerReviewsSection(),
                  const SizedBox(height: 32),
                  AchievementsSection(section: achievementsSection),
                  // const CustomerReviewsSection(),
                  const SizedBox(height: 32),
                  QualificationsSection(section: qualificationsSection),
                  // const CustomerReviewsSection(),
                  const SizedBox(height: 32),
                  AssuranceSection(section: assuranceSection),
                  // const CustomerReviewsSection(),
                  const SizedBox(height: 32),
                  ContactSection(section: contactSection),
                  // const CustomerReviewsSection(),
                  const SizedBox(height: 32),
                  MobileAppSection(section: mobileAppSection),
                  // const CustomerReviewsSection(),
                  const SizedBox(height: 32),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
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
