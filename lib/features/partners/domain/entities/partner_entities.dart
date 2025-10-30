class PartnerEntities {
  final int id;
  final String? nameAr;
  final String? nameEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? logo;
  final String? website;
  final String? category;
  final bool isActive;
  final int displayOrder;
  final String? createdAt;
  final String? updatedAt;

  const PartnerEntities({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.logo,
    required this.website,
    required this.category,
    required this.isActive,
    required this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
  });
}
