import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/partners/domain/entities/partner_entities.dart';
import 'package:view_line/features/partners/presentation/widgets/section_header.dart';

class PartnersSection extends StatelessWidget {
  final List<PartnerEntities> partners;
  const PartnersSection({Key? key, required this.partners}) : super(key: key);

  static const String baseUrl = 'https://your-base-url.com/storage/';
  // 🔹 Replace with your actual base URL if needed.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(
            title: context.isArabic ? "شركاء النجاح" : 'Our Partners',
            icon: Icons.handshake_outlined,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          color: Colors.white,
          height: 280,
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200,

              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: partners.length > 1,
              viewportFraction: 0.7,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
            items: partners.map((partner) {
              final logoUrl = partner.logo != null
                  ? (partner.logo!.startsWith('http')
                        ? partner.logo!
                        : '$baseUrl${partner.logo}')
                  : null;

              final name = context.isArabic
                  ? (partner.nameAr ?? '')
                  : (partner.nameEn ?? '');

              return Builder(
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade100,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ====== Partner Logo ======
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: logoUrl != null
                              ? Image.network(
                                  logoUrl,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                        Icons.broken_image,
                                        size: 60,
                                        color: Colors.grey,
                                      ),
                                )
                              : const Icon(
                                  Icons.image_not_supported,
                                  size: 60,
                                  color: Colors.grey,
                                ),
                        ),
                        const SizedBox(height: 16),

                        // ====== Partner Name ======
                        Text(
                          name.isNotEmpty ? name : '---',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),

                        // ====== Category (Optional) ======
                        if (partner.category != null) ...[
                          const SizedBox(height: 6),
                          Text(
                            partner.category!,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
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
      ],
    );
  }
}
