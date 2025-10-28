import 'package:flutter/material.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/home_section_entities.dart';
import 'package:view_line/features/home/presentation/widgets/features_card.dart';

class FeaturesSection extends StatelessWidget {
  final HomeSectionEntities section;
  static const Color primary = Color(0xFFFE910B);
  static const Color secondary = Color(0xFF2B388F);

  const FeaturesSection({Key? key, required this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final features = section.additionalData!.features ?? [];
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final title = isArabic ? section.titleAr : section.titleEn;
    final subtitle = isArabic ? section.subtitleAr : section.subtitleEn;

    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Column(
              children: [
                Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: secondary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          // Horizontal Scrolling Features
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: features.length,
              itemBuilder: (context, index) {
                final feature = features[index];
                final featureTitle = isArabic
                    ? feature.titleAr ?? ''
                    : feature.titleEn ?? '';
                final featureDescription = isArabic
                    ? feature.descriptionAr ?? ''
                    : feature.descriptionEn ?? '';

                return Padding(
                  padding: EdgeInsets.only(
                    right: isArabic ? 0 : 16,
                    left: isArabic ? 16 : 0,
                  ),
                  child: FeatureCard(
                    icon: feature.icon ?? '',
                    title: featureTitle,
                    description: featureDescription,
                    primaryColor: primary,
                    secondaryColor: secondary,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
