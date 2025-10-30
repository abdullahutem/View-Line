// lib/features/services/domain/entities/service_entities.dart

class ServicesEntities {
  final int id;
  final String titleAr;
  final String titleEn;
  final String descriptionAr;
  final String descriptionEn;
  final String? coverImage;
  final String? icon;
  final String slug;
  final bool isActive;
  final int displayOrder;
  final dynamic additionalData;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ServicesEntities({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.coverImage,
    required this.icon,
    required this.slug,
    required this.isActive,
    required this.displayOrder,
    required this.additionalData,
    required this.createdAt,
    required this.updatedAt,
  });
}
