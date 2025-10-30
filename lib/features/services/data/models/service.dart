import 'package:view_line/features/services/domain/entities/services_entities.dart';

class ServiceModel extends ServicesEntities {
  ServiceModel({
    required super.id,
    required super.titleAr,
    required super.titleEn,
    required super.descriptionAr,
    required super.descriptionEn,
    required super.coverImage,
    required super.icon,
    required super.slug,
    required super.isActive,
    required super.displayOrder,
    required super.additionalData,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] ?? 0,
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
      descriptionAr: json['description_ar'] ?? '',
      descriptionEn: json['description_en'] ?? '',
      coverImage: json['cover_image'],
      icon: json['icon'],
      slug: json['slug'] ?? '',
      isActive: json['is_active'] ?? false,
      displayOrder: json['display_order'] ?? 0,
      additionalData: json['additional_data'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title_ar': titleAr,
      'title_en': titleEn,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'cover_image': coverImage,
      'icon': icon,
      'slug': slug,
      'is_active': isActive,
      'display_order': displayOrder,
      'additional_data': additionalData,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  static List<ServiceModel> listFromJson(Map<String, dynamic> json) {
    final dataList = json['data'] as List;
    return dataList
        .map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
