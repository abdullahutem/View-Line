import 'package:flutter/material.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/home_section_entities.dart';
import 'package:view_line/features/home/presentation/widgets/destination_card.dart';

class TopDestinationsSection extends StatelessWidget {
  final HomeSectionEntities section;
  static const Color primary = Color(0xFFFE910B);
  static const Color secondary = Color(0xFF2B388F);

  const TopDestinationsSection({Key? key, required this.section})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projects = section.additionalData!.projects ?? [];
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final title = isArabic ? section.titleAr : section.titleEn;
    final subtitle = isArabic ? section.subtitleAr : section.subtitleEn;
    final description = isArabic
        ? section.descriptionAr
        : section.descriptionEn;

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
            child: Column(
              children: [
                Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: secondary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (description != null && description.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ],
            ),
          ),

          // Horizontal Scrolling Destinations
          SizedBox(
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                final projectTitle = isArabic
                    ? project.titleAr ?? ''
                    : project.titleEn ?? '';

                return Padding(
                  padding: EdgeInsets.only(
                    right: isArabic ? 0 : 20,
                    left: isArabic ? 20 : 0,
                  ),
                  child: DestinationCard(
                    image: project.image ?? '',
                    category: project.category ?? '',
                    title: projectTitle,
                    primaryColor: primary,
                    secondaryColor: secondary,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
