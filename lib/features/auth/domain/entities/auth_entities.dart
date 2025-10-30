class AuthEntities {
  final UserEntities user;
  final String token;
  final bool success;
  final String message;
  final int statusCode;

  const AuthEntities({
    required this.user,
    required this.token,
    required this.success,
    required this.message,
    required this.statusCode,
  });
}

class UserEntities {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String whatsappNumber;
  final String? type;
  final bool isActive;
  final int? medicalFacilityId;
  final int? createdBy;
  final int? updatedBy;
  final String createdAt;
  final String updatedAt;

  const UserEntities({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.whatsappNumber,
    required this.type,
    required this.isActive,
    required this.medicalFacilityId,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });
}
