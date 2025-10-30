import 'package:view_line/features/team_members/domain/entities/team_members_entities.dart';

class TeamMemberModel extends TeamMemberEntities {
  const TeamMemberModel({
    required super.id,
    required super.socialLinks,
    required super.isActive,
    required super.displayOrder,
    required super.nameAr,
    required super.nameEn,
    required super.positionAr,
    required super.positionEn,
    required super.bioAr,
    required super.bioEn,
    required super.image,
    required super.email,
    required super.phone,
    required super.createdAt,
    required super.updatedAt,
  });
  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      id: json['id'] ?? 0,
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      positionAr: json['position_ar'],
      positionEn: json['position_en'],
      bioAr: json['bio_ar'],
      bioEn: json['bio_en'],
      image: json['image'],
      email: json['email'],
      phone: json['phone'],
      socialLinks:
          (json['social_links'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
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
      'position_ar': positionAr,
      'position_en': positionEn,
      'bio_ar': bioAr,
      'bio_en': bioEn,
      'image': image,
      'email': email,
      'phone': phone,
      'social_links': socialLinks,
      'is_active': isActive,
      'display_order': displayOrder,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static List<TeamMemberModel> listFromJson(Map<String, dynamic> json) {
    final dataList = json['data'] as List;
    return dataList
        .map((e) => TeamMemberModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
