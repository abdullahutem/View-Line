import 'package:view_line/features/home/domain/entities/sub_enities/feature_entities.dart';

class AdditionalDataEntities {
  final List<FeatureEntities>? features;
  final List<ItemEntities>? items;
  final List<ProjectEntities>? projects;
  final List<String>? categories;
  final List<TestimonialEntities>? testimonials;
  final List<StatEntities>? stats;
  final List<MemberEntities>? members;
  final SocialMediaEntities? socialMedia;
  final String? logo;
  final String? email;
  final String? phone;
  final String? addressAr;
  final String? addressEn;
  final String? labelAr;
  final String? labelEn;
  final String? badgeAr;
  final String? badgeEn;
  final String? workingHoursEn;
  final String? workingHoursAr;
  final String? mobileImage;
  final String? googlePlayUrl;
  final String? appStoreUrl;

  AdditionalDataEntities({
    required this.features,
    required this.items,
    required this.projects,
    required this.categories,
    required this.testimonials,
    required this.stats,
    required this.members,
    required this.socialMedia,
    required this.logo,
    required this.email,
    required this.phone,
    required this.addressAr,
    required this.addressEn,
    required this.labelAr,
    required this.labelEn,
    required this.badgeAr,
    required this.badgeEn,
    required this.workingHoursEn,
    required this.workingHoursAr,
    required this.mobileImage,
    required this.googlePlayUrl,
    required this.appStoreUrl,
  });

  factory AdditionalDataEntities.fromJson(Map<String, dynamic> json) {
    print('=== Parsing AdditionalDataEntities ===');
    print('Raw JSON: $json');

    return AdditionalDataEntities(
      features: (json['features'] as List?)
          ?.map((e) => FeatureEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List?)
          ?.map((e) => ItemEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      projects: (json['projects'] as List?)
          ?.map((e) => ProjectEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List?)
          ?.map((e) => e.toString())
          .toList(),
      testimonials: (json['testimonials'] as List?)
          ?.map((e) => TestimonialEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List?)
          ?.map((e) => StatEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['members'] as List?)
          ?.map((e) => MemberEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedia: json['social_media'] != null
          ? SocialMediaEntities.fromJson(
              json['social_media'] as Map<String, dynamic>,
            )
          : null,
      logo: json['logo'] as String?,
      email: json["additional_data"]['email'],
      phone: json['phone'] as String?,
      addressAr: json['address_ar'] as String?,
      addressEn: json['address_en'] as String?,
      labelAr: json['label_ar'] as String?,
      labelEn: json['label_en'] as String?,
      badgeAr: json['badge_ar'] as String?,
      badgeEn: json['badge_en'] as String?,
      workingHoursAr: json['working_hours_ar'] as String?,
      workingHoursEn: json['working_hours_en'] as String?,

      mobileImage: json['mobile_image'] as String?,
      googlePlayUrl: json['google_play_url'] as String?,
      appStoreUrl: json['app_store_url'] as String?,
    );
  }
}
