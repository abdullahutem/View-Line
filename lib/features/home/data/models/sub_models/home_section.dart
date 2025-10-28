import 'package:view_line/features/home/data/models/sub_models/Slide.dart';
import 'package:view_line/features/home/data/models/sub_models/additional_data.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/home_section_entities.dart';

class HomeSection extends HomeSectionEntities {
  final String? createdAt;
  final String? updatedAt;

  HomeSection({
    required super.id,
    required super.sectionKey,
    super.titleAr,
    super.titleEn,
    super.subtitleAr,
    super.subtitleEn,
    super.descriptionAr,
    super.descriptionEn,
    super.contentAr,
    super.contentEn,
    super.buttonTextAr,
    super.buttonTextEn,
    super.buttonUrl,
    super.image,
    super.backgroundImage,
    super.videoUrl,
    required super.displayOrder,
    required super.isActive,
    this.createdAt,
    this.updatedAt,
    super.slides,
    super.additionalData,
  });

  factory HomeSection.fromJson(Map<String, dynamic> json) {
    return HomeSection(
      id: json['id'] ?? 0,
      sectionKey: json['section_key'] ?? '',
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      subtitleAr: json['subtitle_ar'],
      subtitleEn: json['subtitle_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      contentAr: json['content_ar'],
      contentEn: json['content_en'],
      buttonTextAr: json['button_text_ar'],
      buttonTextEn: json['button_text_en'],
      buttonUrl: json['button_url'],
      image: json['image'],
      backgroundImage: json['background_image'],
      videoUrl: json['video_url'],
      displayOrder: json['display_order'] ?? 0,
      isActive: json['is_active'] ?? false,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      slides:
          (json['slides'] as List?)?.map((e) => Slide.fromJson(e)).toList() ??
          [],
      additionalData: json['additional_data'] != null
          ? AdditionalData.fromJson(json['additional_data'])
          : null,
    );
  }
}
