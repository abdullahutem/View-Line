import 'package:flutter/material.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/home_section_entities.dart';
import 'package:view_line/features/home/presentation/widgets/assurance_card.dart';

class AssuranceSection extends StatelessWidget {
  final HomeSectionEntities section;
  static const Color primary = Color(0xFFFE910B);
  static const Color secondary = Color(0xFF2B388F);

  const AssuranceSection({Key? key, required this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = section.additionalData!.items ?? [];
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final title = isArabic ? section.titleAr : section.titleEn;
    final subtitle = isArabic ? section.subtitleAr : section.subtitleEn;
    final description = isArabic
        ? section.descriptionAr
        : section.descriptionEn;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primary.withOpacity(0.02),
            secondary.withOpacity(0.02),
            Colors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          // Section Header
          Column(
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primary.withOpacity(0.1),
                      secondary.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified_user, color: primary, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      isArabic ? 'ضمان وأمان' : 'Trust & Safety',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: secondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: secondary,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 12),

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
                const SizedBox(height: 16),
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ],
          ),

          const SizedBox(height: 50),

          // Assurance Cards (Horizontally Scrollable)
          SizedBox(
            height: 360, // Adjust the height based on your card size
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                final item = items[index];
                final itemTitle = isArabic
                    ? item.titleAr ?? ''
                    : item.titleEn ?? '';
                final itemDescription = isArabic
                    ? item.descriptionAr ?? ''
                    : item.descriptionEn ?? '';

                return Container(
                  width:
                      MediaQuery.of(context).size.width *
                      0.45, // 2 visible at a time
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: AssuranceCard(
                    icon: item.icon ?? '',
                    title: itemTitle,
                    description: itemDescription,
                    index: index,
                    primaryColor: primary,
                    secondaryColor: secondary,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 50),

          // Bottom Trust Message
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  secondary.withOpacity(0.05),
                  primary.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: primary.withOpacity(0.2), width: 1.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(Icons.check_circle, color: primary, size: 24),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Text(
                    isArabic
                        ? 'نلتزم بأعلى معايير الأمان والخصوصية لحماية رحلتك'
                        : 'We are committed to the highest standards of security and privacy',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: secondary,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Usage Example:
// AssuranceSection(section: assuranceSection)
