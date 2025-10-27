import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/data/mock_data.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/home/presentation/screens/all_reviews_screen.dart';
import 'package:view_line/features/home/presentation/widgets/review_card.dart';

class CustomerReviewsSection extends StatefulWidget {
  const CustomerReviewsSection({super.key});

  @override
  State<CustomerReviewsSection> createState() => _CustomerReviewsSectionState();
}

class _CustomerReviewsSectionState extends State<CustomerReviewsSection>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _headerController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _headerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.5, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _headerController,
            curve: Curves.easeOutCubic,
          ),
        );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _headerController, curve: Curves.easeIn));

    _headerController.forward();
  }

  @override
  void dispose() {
    _headerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reviews = MockData.getCustomerReviews();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      color: AppColors.background,
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.rate_review,
                            color: AppColors.primary,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          context.isArabic
                              ? 'ما يقوله عملاؤنا'
                              : 'What Our Customers Say',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.isArabic
                          ? 'تجارب حقيقية من مسافرين حول العالم'
                          : 'Real experiences from travelers around the world',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Reviews Carousel
          CarouselSlider.builder(
            itemCount: reviews.length,
            itemBuilder: (context, index, realIndex) {
              return ReviewCard(review: reviews[index]);
            },
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.linear,
              enlargeCenterPage: false,
              viewportFraction: 0.85,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),

          const SizedBox(height: 16),

          // Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: reviews.asMap().entries.map((entry) {
              return Container(
                width: _currentIndex == entry.key ? 24 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _currentIndex == entry.key
                      ? AppColors.primary
                      : AppColors.border,
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // See All Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AllReviewsScreen()),
                  );
                },
                icon: const Icon(Icons.visibility),
                label: Text(
                  context.isArabic
                      ? 'عرض جميع التقييمات'
                      : 'See All Reviews', // Arabic
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Stats Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.1),
                    AppColors.secondary.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem(
                    icon: Icons.star,
                    value: '4.9',
                    label: context.isArabic ? 'متوسط التقييم' : 'Avg Rating',
                  ),
                  Container(width: 1, height: 40, color: AppColors.border),
                  _buildStatItem(
                    icon: Icons.people,
                    value: '${reviews.length}+',
                    label: context.isArabic ? 'التقييمات' : 'Reviews',
                  ),
                  Container(width: 1, height: 40, color: AppColors.border),
                  _buildStatItem(
                    icon: Icons.thumb_up,
                    value: '100%',
                    label: context.isArabic ? 'مُوصى به' : 'Recommended',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
