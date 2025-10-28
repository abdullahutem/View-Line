import 'package:view_line/features/home/domain/entities/sub_enities/Slide_entities.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/additional_data_entities.dart';

class HomeSectionEntities {
  final int id;
  final String sectionKey;
  final String? titleAr;
  final String? titleEn;
  final String? subtitleAr;
  final String? subtitleEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? contentAr;
  final String? contentEn;
  final String? buttonTextAr;
  final String? buttonTextEn;
  final String? buttonUrl;
  final String? image;
  final String? backgroundImage;
  final String? videoUrl;
  final int displayOrder;
  final bool isActive;
  final List<SlideEntities>? slides;
  final AdditionalDataEntities? additionalData;

  HomeSectionEntities({
    required this.id,
    required this.sectionKey,
    this.titleAr,
    this.titleEn,
    this.subtitleAr,
    this.subtitleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.contentAr,
    this.contentEn,
    this.buttonTextAr,
    this.buttonTextEn,
    this.buttonUrl,
    this.image,
    this.backgroundImage,
    this.videoUrl,
    required this.displayOrder,
    required this.isActive,

    this.slides,
    this.additionalData,
  });

  factory HomeSectionEntities.fromJson(Map<String, dynamic> json) {
    return HomeSectionEntities(
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
      slides:
          (json['slides'] as List?)
              ?.map((e) => SlideEntities.fromJson(e))
              .toList() ??
          [],
      additionalData: json['additional_data'] != null
          ? AdditionalDataEntities.fromJson(json['additional_data'])
          : null,
    );
  }
}
