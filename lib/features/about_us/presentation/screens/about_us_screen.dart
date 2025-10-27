import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/about_us/controller/cubit/about_cubit.dart';
import 'package:view_line/features/about_us/models/about_us_model.dart';
import 'package:view_line/features/about_us/presentation/widgets/branches_section.dart';
import 'package:view_line/features/about_us/presentation/widgets/employee_slider.dart';
import 'package:view_line/features/about_us/presentation/widgets/partner_slider.dart';
import 'package:view_line/features/about_us/presentation/widgets/section_header.dart';
import 'package:view_line/features/about_us/presentation/widgets/value_card.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AboutCubit()..loadAboutData(),
      child: Scaffold(
        body: BlocBuilder<AboutCubit, AboutState>(
          builder: (context, state) {
            if (state is AboutLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AboutError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 60,
                      color: AppColors.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: AppColors.error),
                    ),
                  ],
                ),
              );
            }

            if (state is AboutLoaded) {
              final data = state.data;

              return CustomScrollView(
                slivers: [
                  // App Bar
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        context.isArabic ? 'من نحن' : 'About Us',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      centerTitle: true,
                      background: Container(color: Colors.white),
                    ),
                  ),

                  // Content
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),

                          // Logo and App Info
                          Center(child: _buildHeaderSection(data, context)),

                          const SizedBox(height: 32),

                          // Description Section
                          _buildDescriptionSection(data, context),

                          const SizedBox(height: 32),

                          // Vision Section
                          _buildVisionSection(data, context),

                          const SizedBox(height: 32),

                          // Message Section
                          _buildMessageSection(data, context),

                          const SizedBox(height: 32),

                          // Values Section
                          _buildValuesSection(data, context),

                          const SizedBox(height: 32),

                          // Partners Section
                          _buildPartnersSection(data, context),
                          const SizedBox(height: 32),

                          // OUR BRANCHES SECTION - ADD THIS
                          const BranchesSection(),

                          const SizedBox(height: 32),

                          // Employees Section
                          _buildEmployeesSection(data, context),

                          const SizedBox(height: 32),

                          // Contact Section
                          _buildContactSection(context),

                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildHeaderSection(data, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/logo.jpeg"),
          // Logo
          const SizedBox(height: 10),

          // App Name
          Text(
            context.isArabic ? data.appNameAr : data.appNameEn,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            context.isArabic ? data.subtitleAr : data.subtitleEn,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(data, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: context.isArabic ? "من نحن" : 'Who We Are',
            icon: Icons.info_outline,
          ),
          const SizedBox(height: 16),
          Text(
            context.isArabic ? data.descriptionAr : data.descriptionEn,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisionSection(data, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.secondary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.visibility,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                context.isArabic ? "رؤيتنا" : 'Our Vision',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            context.isArabic ? data.visionAr : data.visionEn,

            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              height: 2,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageSection(data, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.secondary.withOpacity(0.1),
            AppColors.primary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.secondary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.message, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                context.isArabic ? "رسالتنا" : 'Our Message',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            context.isArabic ? data.messageAr : data.messageEn,

            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValuesSection(data, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: context.isArabic ? "قيمنا" : 'Our Values',
            icon: Icons.favorite_outline,
          ),
          const SizedBox(height: 16),
          ...context.isArabic
              ? data.valuesAr.asMap().entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ValueCard(value: entry.value, index: entry.key),
                  );
                }).toList()
              : data.valuesEn.asMap().entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ValueCard(value: entry.valuesEn, index: entry.keyEn),
                  );
                }).toList(),
        ],
      ),
    );
  }

  Widget _buildPartnersSection(data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(
            title: context.isArabic ? "شركاء النجاح" : 'Our Partners',
            icon: Icons.handshake_outlined,
          ),
        ),
        const SizedBox(height: 16),
        PartnerSlider(
          partners: data.partners, // Pass the original PartnerModel list
        ),
      ],
    );
  }

  Widget _buildEmployeesSection(data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(
            title: context.isArabic ? "فريقنا" : 'Our Team',
            icon: Icons.people_outline,
          ),
        ),
        const SizedBox(height: 16),
        EmployeeSlider(employees: data.employees),
      ],
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.contact_support, size: 48, color: Colors.white),
          const SizedBox(height: 16),
          Text(
            context.isArabic ? "تواصل معنا" : 'Get In Touch',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.isArabic
                ? "هل لديك أسئلة؟ يسعدنا أن نسمع منك!"
                : 'Have questions? We\'d love to hear from you!',
            style: TextStyle(fontSize: 12, color: Colors.white, height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildContactButton(
                icon: Icons.email,
                label: context.isArabic ? "بريد إلكتروني" : 'Email',
                onTap: () {},
              ),
              _buildContactButton(
                icon: Icons.phone,
                label: context.isArabic ? "إتصال" : 'Call',
                onTap: () {},
              ),
              _buildContactButton(
                icon: Icons.chat,
                label: context.isArabic ? 'محادثة' : 'Chat',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
