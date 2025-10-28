import 'package:flutter/material.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/home_section_entities.dart';
import 'package:view_line/features/home/presentation/widgets/review_card.dart';

class TestimonialsSection extends StatelessWidget {
  final HomeSectionEntities section;
  static const Color primary = Color(0xFFFE910B);
  static const Color secondary = Color(0xFF2B388F);

  const TestimonialsSection({Key? key, required this.section})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final testimonials = section.additionalData!.testimonials ?? [];
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final title = isArabic ? section.titleAr : section.titleEn;
    final subtitle = isArabic ? section.subtitleAr : section.subtitleEn;
    final description = isArabic
        ? section.descriptionAr
        : section.descriptionEn;

    return Container(
      width: double.infinity,
      color: Colors.grey[50],
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
                    fontSize: 16,
                    color: primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (description != null && description.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Horizontal Scrolling Testimonials
          SizedBox(
            height: 220, // Increased height to accommodate content
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final testimonial = testimonials[index];
                final travelerName = isArabic
                    ? testimonial.nameAr ?? ''
                    : testimonial.nameEn ?? '';
                final travelerComment = isArabic
                    ? testimonial.commentAr ?? ''
                    : testimonial.commentEn ?? '';

                return ReviewCard(
                  image: testimonial.image ?? '',
                  rating: testimonial.rating ?? 5,
                  name: travelerName,
                  comment: travelerComment,
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
