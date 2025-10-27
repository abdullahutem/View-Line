import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/about_us/models/partner_model.dart';

class PartnerSlider extends StatelessWidget {
  final List<PartnerModel> partners;

  const PartnerSlider({super.key, required this.partners});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 250,
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 160,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: partners.length > 1,
          viewportFraction: 0.8,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
        ),
        items: partners.map((partner) {
          return Builder(
            builder: (context) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SvgPicture.asset(
                        partner.logoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      context.isArabic ? partner.nameAr : partner.nameEn,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
