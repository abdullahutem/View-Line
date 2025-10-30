class TeamMemberEntities {
  final int id;
  final String? nameAr;
  final String? nameEn;
  final String? positionAr;
  final String? positionEn;
  final String? bioAr;
  final String? bioEn;
  final String? image;
  final String? email;
  final String? phone;
  final List<String> socialLinks;
  final bool isActive;
  final int displayOrder;
  final String? createdAt;
  final String? updatedAt;

  const TeamMemberEntities({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.positionAr,
    required this.positionEn,
    required this.bioAr,
    required this.bioEn,
    required this.image,
    required this.email,
    required this.phone,
    required this.socialLinks,
    required this.isActive,
    required this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
  });
}
