import 'package:flutter/material.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/home_section_entities.dart';

class MobileAppSection extends StatelessWidget {
  final HomeSectionEntities section;

  const MobileAppSection({Key? key, required this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final features = section.additionalData?.features as List? ?? [];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: Colors.grey[50],
      child: Column(
        children: [
          // Title and Subtitle
          Column(
            children: [
              Text(
                isArabic ? (section.titleAr ?? '') : (section.titleEn ?? ''),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              Text(
                isArabic
                    ? (section.subtitleAr ?? '')
                    : (section.subtitleEn ?? ''),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Content Row
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return _buildMobileLayout(isArabic, features);
              } else {
                return _buildDesktopLayout(isArabic, features);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(bool isArabic, List features) {
    return Column(
      children: [
        // Mobile App Image
        if (section.additionalData?.mobileImage != null)
          Container(
            height: 300,
            margin: const EdgeInsets.only(bottom: 30),
            child: Image.network(
              _getImageUrl(section.additionalData!.mobileImage!),
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/1.png', fit: BoxFit.contain);
              },
            ),
          ),

        // Features List
        _buildFeaturesList(isArabic, features),
        const SizedBox(height: 30),

        // App Store Buttons
        _buildAppStoreButtons(),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isArabic, List features) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side - Features and App Store buttons
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFeaturesList(isArabic, features),
              const SizedBox(height: 40),
              _buildAppStoreButtons(),
            ],
          ),
        ),

        const SizedBox(width: 60),

        // Right side - Mobile App Image
        if (section.additionalData?.mobileImage != null)
          Expanded(
            child: Container(
              height: 400,
              child: Image.network(
                _getImageUrl(section.additionalData!.mobileImage!),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/1.png',
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFeaturesList(bool isArabic, List features) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var feature in features)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    isArabic ? feature.textAr : feature.textEn,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildAppStoreButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Play Button
        InkWell(
          onTap: () {
            // Handle Google Play store navigation
            final url = section.additionalData?.googlePlayUrl;
            if (url != null && url != '#') {
              // Launch URL
            }
          },
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.android, color: Colors.grey[700]),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GET IT ON',
                      style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                    ),
                    Text(
                      'Google Play',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 16),

        // App Store Button
        InkWell(
          onTap: () {
            // Handle App Store navigation
            final url = section.additionalData?.appStoreUrl;
            if (url != null && url != '#') {
              // Launch URL
            }
          },
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.apple, color: Colors.grey[700]),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Download on the',
                      style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                    ),
                    Text(
                      'App Store',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getImageUrl(String imagePath) {
    // Replace with your actual image base URL
    return 'https://your-domain.com/storage/$imagePath';
  }
}
