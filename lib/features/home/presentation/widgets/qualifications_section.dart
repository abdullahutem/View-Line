import 'package:flutter/material.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/home_section_entities.dart';
import 'package:view_line/features/home/presentation/widgets/qualification_badge.dart';

class QualificationsSection extends StatelessWidget {
  final HomeSectionEntities section;
  static const Color primary = Color(0xFFFE910B);
  static const Color secondary = Color(0xFF2B388F);

  const QualificationsSection({Key? key, required this.section})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = section.additionalData!.items ?? [];
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final title = isArabic ? section.titleAr : section.titleEn;
    final subtitle = isArabic ? section.subtitleAr : section.subtitleEn;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, secondary.withOpacity(0.02)],
        ),
      ),
      child: Column(
        children: [
          // Section Header
          Column(
            children: [
              // Shield Icon
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primary.withOpacity(0.1),
                      secondary.withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primary.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(Icons.shield_outlined, color: primary, size: 48),
              ),
              const SizedBox(height: 20),

              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: secondary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                subtitle ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Qualifications Badges
          // LayoutBuilder(
          //   builder: (context, constraints) {
          //     // Responsive layout
          //     if (constraints.maxWidth > 900) {
          //       // Desktop: 4 columns
          //       return Wrap(
          //         spacing: 16,
          //         runSpacing: 16,
          //         alignment: WrapAlignment.center,
          //         children: List.generate(items.length, (index) {
          //           final item = items[index];
          //           final itemTitle = isArabic
          //               ? item.titleAr ?? ''
          //               : item.titleEn ?? '';
          //           return SizedBox(
          //             width: (constraints.maxWidth - 64) / 4,
          //             child: QualificationBadge(
          //               title: itemTitle,
          //               index: index,
          //               primaryColor: primary,
          //               secondaryColor: secondary,
          //             ),
          //           );
          //         }),
          //       );
          //     } else if (constraints.maxWidth > 600) {
          //       // Tablet: 2 columns
          //       return Wrap(
          //         spacing: 16,
          //         runSpacing: 16,
          //         alignment: WrapAlignment.center,
          //         children: List.generate(items.length, (index) {
          //           final item = items[index];
          //           final itemTitle = isArabic
          //               ? item.titleAr ?? ''
          //               : item.titleEn ?? '';
          //           return SizedBox(
          //             width: (constraints.maxWidth - 48) / 2,
          //             child: QualificationBadge(
          //               title: itemTitle,
          //               index: index,
          //               primaryColor: primary,
          //               secondaryColor: secondary,
          //             ),
          //           );
          //         }),
          //       );
          //     } else {
          //       // Mobile: Single column
          //       return Column(
          //         children: List.generate(items.length, (index) {
          //           final item = items[index];
          //           final itemTitle = isArabic
          //               ? item.titleAr ?? ''
          //               : item.titleEn ?? '';
          //           return Padding(
          //             padding: const EdgeInsets.only(bottom: 16),
          //             child: QualificationBadge(
          //               title: itemTitle,
          //               index: index,
          //               primaryColor: primary,
          //               secondaryColor: secondary,
          //             ),
          //           );
          //         }),
          //       );
          //     }
          //   },
          // ),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = 2; // 2 items per row
              final spacing = 16.0;
              final itemWidth =
                  (constraints.maxWidth - (spacing * (crossAxisCount - 1))) /
                  crossAxisCount;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                alignment: WrapAlignment.center,
                children: List.generate(items.length, (index) {
                  final item = items[index];
                  final itemTitle = isArabic
                      ? item.titleAr ?? ''
                      : item.titleEn ?? '';

                  return SizedBox(
                    width: itemWidth,
                    child: QualificationBadge(
                      title: itemTitle,
                      index: index,
                      primaryColor: primary,
                      secondaryColor: secondary,
                    ),
                  );
                }),
              );
            },
          ),

          const SizedBox(height: 40),

          // Trust Badge
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primary.withOpacity(0.05),
                  secondary.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: primary.withOpacity(0.2), width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, color: primary, size: 24),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    isArabic
                        ? 'معتمدون ومرخصون من قبل الهيئات الدولية'
                        : 'Certified and licensed by international authorities',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: secondary,
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
// QualificationsSection(section: qualificationsSection)
