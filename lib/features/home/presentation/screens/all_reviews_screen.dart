import 'package:flutter/material.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/data/mock_data.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/home/models/customer_review.dart';

class AllReviewsScreen extends StatefulWidget {
  const AllReviewsScreen({super.key});

  @override
  State<AllReviewsScreen> createState() => _AllReviewsScreenState();
}

class _AllReviewsScreenState extends State<AllReviewsScreen> {
  String _selectedFilter = 'All';
  final List<String> _filtersEn = ['All', '5 Stars', '4 Stars', 'Recent'];
  final List<String> _filtersAr = ['الكل', '5 نجوم', '4 نجوم', 'الأحدث'];

  @override
  Widget build(BuildContext context) {
    final allReviews = MockData.getCustomerReviews();
    final filteredReviews = _filterReviews(allReviews);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.isArabic ? 'تقييمات العملاء' : 'Customer Reviews'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterBottomSheet(context);
            },
          ),
        ],
      ),

      body: Column(
        children: [
          // Stats Header
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            '4.9',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            context.isArabic
                                ? 'بناءً على ${allReviews.length} تقييم'
                                : 'Based on ${allReviews.length} reviews',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildRatingBars(allReviews),
              ],
            ),
          ),

          // Filter Chips
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: AppColors.background,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: context.isArabic
                    ? _filtersAr.map((filter) {
                        final isSelected = _selectedFilter == filter;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(filter),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                _selectedFilter = filter;
                              });
                            },
                            backgroundColor: Colors.white,
                            selectedColor: AppColors.primary.withOpacity(0.2),
                            labelStyle: TextStyle(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.border,
                              ),
                            ),
                          ),
                        );
                      }).toList()
                    : _filtersEn.map((filter) {
                        final isSelected = _selectedFilter == filter;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(filter),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                _selectedFilter = filter;
                              });
                            },
                            backgroundColor: Colors.white,
                            selectedColor: AppColors.primary.withOpacity(0.2),
                            labelStyle: TextStyle(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.border,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
              ),
            ),
          ),

          // Reviews List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredReviews.length,
              itemBuilder: (context, index) {
                return _buildReviewListItem(filteredReviews[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBars(List<CustomerReview> reviews) {
    final Map<int, int> ratingCounts = {5: 0, 4: 0, 3: 0, 2: 0, 1: 0};

    for (var review in reviews) {
      ratingCounts[review.rating.round()] =
          (ratingCounts[review.rating.round()] ?? 0) + 1;
    }

    return Column(
      children: [5, 4, 3, 2, 1].map((rating) {
        final count = ratingCounts[rating] ?? 0;
        final percentage = reviews.isEmpty ? 0.0 : (count / reviews.length);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Text(
                '$rating',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.star, size: 14, color: Colors.amber),
              const SizedBox(width: 8),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: percentage,
                    backgroundColor: AppColors.border,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                    minHeight: 8,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                count.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildReviewListItem(CustomerReview review) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.border.withOpacity(0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(review.profileImageUrl),
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.isArabic
                            ? review.customerNameAr
                            : review.customerNameAr,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            if (index < review.rating.floor()) {
                              return const Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.amber,
                              );
                            } else if (index < review.rating &&
                                review.rating % 1 != 0) {
                              return const Icon(
                                Icons.star_half,
                                size: 14,
                                color: Colors.amber,
                              );
                            } else {
                              return Icon(
                                Icons.star_border,
                                size: 14,
                                color: Colors.grey[300],
                              );
                            }
                          }),
                          const SizedBox(width: 6),
                          Text(
                            review.date,
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              context.isArabic ? review.commentAr : review.commentEn,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 14,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      context.isArabic
                          ? '${review.tripNameAr} • ${review.destinationAr}'
                          : '${review.tripNameEn} • ${review.destinationEn}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<CustomerReview> _filterReviews(List<CustomerReview> reviews) {
    if (context.isArabic) {
      switch (_selectedFilter) {
        case '5 نجوم':
          return reviews.where((review) => review.rating == 5.0).toList();
        case '4 نجوم':
          return reviews
              .where((review) => review.rating >= 4.0 && review.rating < 5.0)
              .toList();
        case 'الأحدث':
          return reviews.reversed.toList();
        default: // 'الكل'
          return reviews;
      }
    } else {
      switch (_selectedFilter) {
        case '5 Stars':
          return reviews.where((review) => review.rating == 5.0).toList();
        case '4 Stars':
          return reviews
              .where((review) => review.rating >= 4.0 && review.rating < 5.0)
              .toList();
        case 'Recent':
          return reviews.reversed.toList();
        default: // 'All'
          return reviews;
      }
    }
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    context.isArabic ? 'تصفية التقييمات' : 'Filter Reviews',

                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              context.isArabic
                  ? Column(
                      children: _filtersAr.map((filter) {
                        final isSelected = _selectedFilter == filter;
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio<String>(
                            value: filter,
                            groupValue: _selectedFilter,
                            onChanged: (value) {
                              setState(() {
                                _selectedFilter = value!;
                              });
                              Navigator.pop(context);
                            },
                            activeColor: AppColors.primary,
                          ),
                          title: Text(
                            filter,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _selectedFilter = filter;
                            });
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    )
                  : Column(
                      children: _filtersEn.map((filter) {
                        final isSelected = _selectedFilter == filter;
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio<String>(
                            value: filter,
                            groupValue: _selectedFilter,
                            onChanged: (value) {
                              setState(() {
                                _selectedFilter = value!;
                              });
                              Navigator.pop(context);
                            },
                            activeColor: AppColors.primary,
                          ),
                          title: Text(
                            filter,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _selectedFilter = filter;
                            });
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFilter = context.isArabic ? "الكل" : 'All';
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.background,
                    foregroundColor: AppColors.textPrimary,
                    elevation: 0,
                  ),
                  child: Text(
                    context.isArabic ? 'إعادة تعيين الفلاتر' : 'Reset Filters',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
