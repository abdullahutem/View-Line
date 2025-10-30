class PortfolioEntities {
  final int id;
  final String titleAr;
  final String titleEn;
  final String descriptionAr;
  final String descriptionEn;
  final String image;
  final String categoryAr;
  final String categoryEn;
  final String locationAr;
  final String locationEn;
  final String projectDate;
  final bool isFeatured;
  final bool isActive;
  final int displayOrder;
  final String createdAt;
  final String updatedAt;

  const PortfolioEntities({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.image,
    required this.categoryAr,
    required this.categoryEn,
    required this.locationAr,
    required this.locationEn,
    required this.projectDate,
    required this.isFeatured,
    required this.isActive,
    required this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
  });
}
