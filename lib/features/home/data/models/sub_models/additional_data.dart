import 'package:view_line/features/home/data/models/sub_models/feature.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/additional_data_entities.dart';

class AdditionalData extends AdditionalDataEntities {
  AdditionalData({
    super.features,
    super.items,
    super.projects,
    super.categories,
    super.testimonials,
    super.stats,
    super.members,
    super.logo,
    super.labelAr,
    super.labelEn,
    super.badgeAr,
    super.badgeEn,
    required super.socialMedia,
    required super.email,
    required super.phone,
    required super.addressAr,
    required super.addressEn,
    required super.workingHoursEn,
    required super.workingHoursAr,
    required super.mobileImage,
    required super.googlePlayUrl,
    required super.appStoreUrl,
  });

  factory AdditionalData.fromJson(Map<String, dynamic> json) {
    return AdditionalData(
      features:
          (json['features'] as List?)
              ?.map((e) => Feature.fromJson(e))
              .toList() ??
          [],
      items:
          (json['items'] as List?)?.map((e) => Item.fromJson(e)).toList() ?? [],
      projects:
          (json['projects'] as List?)
              ?.map((e) => Project.fromJson(e))
              .toList() ??
          [],
      categories:
          (json['categories'] as List?)?.map((e) => e.toString()).toList() ??
          [],
      testimonials:
          (json['testimonials'] as List?)
              ?.map((e) => Testimonial.fromJson(e))
              .toList() ??
          [],
      stats:
          (json['stats'] as List?)?.map((e) => Stat.fromJson(e)).toList() ?? [],
      members:
          (json['members'] as List?)?.map((e) => Member.fromJson(e)).toList() ??
          [],
      logo: json['logo'],
      labelAr: json['label_ar'],
      labelEn: json['label_en'],
      badgeAr: json['badge_ar'],
      badgeEn: json['badge_en'],
      socialMedia: json['social_media'] != null
          ? SocialMediaModel.fromJson(
              json['social_media'],
            ) // Make sure this class exists
          : null,
      email: json['email'],
      phone: json['phone'],
      addressAr: json['address_ar'],
      addressEn: json['address_en'],
      workingHoursEn: json['working_hours_ar'],
      workingHoursAr: json['working_hours_en'],
      mobileImage: json['mobile_image'],
      googlePlayUrl: json['google_play_url'],
      appStoreUrl: json['app_store_url'],
    );
  }
}
