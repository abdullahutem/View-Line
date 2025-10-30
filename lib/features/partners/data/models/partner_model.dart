// lib/features/partners/data/models/partner_model.dart

import 'package:view_line/features/partners/domain/entities/partner_entities.dart';

class PartnerModel extends PartnerEntities {
  PartnerModel({
    required super.id,
    required super.isActive,
    required super.displayOrder,
    required super.nameAr,
    required super.nameEn,
    required super.descriptionAr,
    required super.descriptionEn,
    required super.logo,
    required super.website,
    required super.category,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) {
    return PartnerModel(
      id: json['id'] ?? 0,
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      logo: json['logo'],
      website: json['website'],
      category: json['category'],
      isActive: json['is_active'] ?? false,
      displayOrder: json['display_order'] ?? 0,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'logo': logo,
      'website': website,
      'category': category,
      'is_active': isActive,
      'display_order': displayOrder,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static List<PartnerModel> listFromJson(Map<String, dynamic> json) {
    final dataList = json['data'] as List;
    return dataList
        .map((e) => PartnerModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
