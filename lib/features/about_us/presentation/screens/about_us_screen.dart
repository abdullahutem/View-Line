import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/home/data/models/sub_models/home_section.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/additional_data_entities.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/feature_entities.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/home_section_entities.dart';
import 'package:view_line/features/home/presentation/cubit/home_cubit.dart';
import 'package:view_line/features/partners/presentation/cubit/partners_cubit.dart';
import 'package:view_line/features/partners/presentation/screens/partners_section.dart';
import 'package:view_line/features/partners/presentation/widgets/section_header.dart';
import 'package:view_line/features/team_members/presentation/cubit/team_members_cubit.dart';
import 'package:view_line/features/team_members/presentation/widgets/team_member_slider.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is HomeError) {
          return Scaffold(
            body: Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: AppColors.error),
              ),
            ),
          );
        }

        if (state is HomeLoaded) {
          final List<HomeSectionEntities> sections = state.response.data;
          final aboutSection = sections.firstWhere(
            (s) => s.sectionKey == 'about',
            orElse: () => HomeSection(
              id: 0,
              sectionKey: '',
              displayOrder: 0,
              isActive: false,
            ),
          );

          if (aboutSection.sectionKey.isEmpty) {
            return const Scaffold(
              body: Center(child: Text('About section not found')),
            );
          }

          return _AboutUsContent(section: aboutSection);
        }

        return const Scaffold(body: SizedBox.shrink());
      },
    );
  }
}

class _AboutUsContent extends StatelessWidget {
  final HomeSectionEntities section;

  const _AboutUsContent({Key? key, required this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final additionalData = section.additionalData;
    final items = additionalData?.items ?? [];

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PartnersCubit()..getPartners()),
        BlocProvider(create: (context) => TeamMembersCubit()..getTeamMembers()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            isArabic
                ? (additionalData?.labelAr ?? 'من نحن')
                : (additionalData?.labelEn ?? 'About Us'),
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section with Logo
              _buildHeaderSection(context, isArabic, additionalData),

              const SizedBox(height: 32),

              // Description Section
              _buildDescriptionSection(isArabic),

              const SizedBox(height: 48),

              // Vision, Mission, Values Cards
              if (items.isNotEmpty) _buildInfoCards(isArabic, items),

              const SizedBox(height: 32),
              BlocBuilder<PartnersCubit, PartnersState>(
                builder: (context, state) {
                  if (state is PartnersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is PartnersError) {
                    return Center(
                      child: Text(
                        'Error: //${state.message}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  if (state is PartnersLoaded) {
                    final partners = state.partners;
                    if (partners.isEmpty) {
                      return const Center(
                        child: Text(
                          'No partners available',
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }

                    return PartnersSection(partners: partners);
                  }

                  // Default (initial) state
                  return const SizedBox.shrink();
                },
              ),
              BlocBuilder<TeamMembersCubit, TeamMembersState>(
                builder: (context, state) {
                  if (state is TeamMembersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is TeamMembersError) {
                    return Center(
                      child: Text(
                        'Error: ${state.message}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  if (state is TeamMembersLoaded) {
                    final teamMembers = state.teamMembers;
                    if (teamMembers.isEmpty) {
                      return const Center(
                        child: Text(
                          'No team members available',
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }

                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SectionHeader(
                            title: context.isArabic ? "فريقنا" : 'Our Team',
                            icon: Icons.handshake_outlined,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TeamMemberSlider(teamMembers: teamMembers),
                        const SizedBox(height: 50),
                      ],
                    );
                  }

                  // Default (initial) state
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(
    BuildContext context,
    bool isArabic,
    AdditionalDataEntities? additionalData,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary.withOpacity(0.1), Colors.white],
        ),
      ),
      child: Column(
        children: [
          // Logo
          if (additionalData?.logo != null)
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(20),
              child: Image.network(
                additionalData!.logo!,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.travel_explore,
                  size: 60,
                  color: AppColors.primary,
                ),
              ),
            ),

          const SizedBox(height: 24),

          // Title
          Text(
            isArabic ? (section.titleAr ?? '') : (section.titleEn ?? ''),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 12),

          // Subtitle
          Text(
            isArabic ? (section.subtitleAr ?? '') : (section.subtitleEn ?? ''),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(bool isArabic) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: isArabic
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            isArabic
                ? (section.descriptionAr ?? '')
                : (section.descriptionEn ?? ''),
            style: TextStyle(
              fontSize: 14,
              height: 1.8,
              color: Colors.grey.shade700,
              letterSpacing: 0.3,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCards(bool isArabic, List<ItemEntities> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _buildInfoCard(
              isArabic,
              item.icon ?? '',
              isArabic ? (item.titleAr ?? '') : (item.titleEn ?? ''),
              isArabic
                  ? (item.descriptionAr ?? '')
                  : (item.descriptionEn ?? ''),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInfoCard(
    bool isArabic,
    String iconName,
    String title,
    String description,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            children: [
              // Icon Container
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getIconData(iconName),
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Colors.grey.shade600,
            ),
            textAlign: isArabic ? TextAlign.right : TextAlign.left,
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'EyeIcon':
        return Icons.visibility;
      case 'LightBulbIcon':
        return Icons.lightbulb;
      case 'SparklesIcon':
        return Icons.auto_awesome;
      default:
        return Icons.info;
    }
  }
}
