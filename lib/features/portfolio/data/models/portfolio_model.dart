import 'package:view_line/features/portfolio/domain/entities/portfolio_entities.dart';

class PortfolioModel extends PortfolioEntities {
  PortfolioModel({
    required super.id,
    required super.titleAr,
    required super.titleEn,
    required super.descriptionAr,
    required super.descriptionEn,
    required super.image,
    required super.categoryAr,
    required super.categoryEn,
    required super.locationAr,
    required super.locationEn,
    required super.projectDate,
    required super.isFeatured,
    required super.isActive,
    required super.displayOrder,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      id: json['id'] ?? 0,
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
      descriptionAr: json['description_ar'] ?? '',
      descriptionEn: json['description_en'] ?? '',
      image: json['image'] ?? '',
      categoryAr: json['category_ar'] ?? '',
      categoryEn: json['category_en'] ?? '',
      locationAr: json['location_ar'] ?? '',
      locationEn: json['location_en'] ?? '',
      projectDate: json['project_date'] ?? '',
      isFeatured: json['is_featured'] ?? false,
      isActive: json['is_active'] ?? false,
      displayOrder: json['display_order'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title_ar': titleAr,
      'title_en': titleEn,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'image': image,
      'category_ar': categoryAr,
      'category_en': categoryEn,
      'location_ar': locationAr,
      'location_en': locationEn,
      'project_date': projectDate,
      'is_featured': isFeatured,
      'is_active': isActive,
      'display_order': displayOrder,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static List<PortfolioModel> listFromJson(Map<String, dynamic> json) {
    final dataList = json['data'] as List;
    return dataList
        .map((e) => PortfolioModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
