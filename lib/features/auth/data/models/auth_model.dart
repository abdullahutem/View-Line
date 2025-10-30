import 'package:view_line/features/auth/domain/entities/auth_entities.dart';

class AuthModel extends AuthEntities {
  const AuthModel({
    required super.user,
    required super.token,
    required super.success,
    required super.message,
    required super.statusCode,
  });

  factory AuthModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Cannot create AuthModel from null');
    }

    print('AuthModel JSON: $json');

    return AuthModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>? ?? {}),
      token: json["data"]['token'] as String? ?? '',
      success: json['success'],
      message: json['message'] as String? ?? '',
      statusCode: json['status_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'user': (user as UserModel).toJson(), 'token': token};
  }
}

class UserModel extends UserEntities {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.whatsappNumber,
    super.type,
    required super.isActive,
    super.medicalFacilityId,
    super.createdBy,
    super.updatedBy,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Cannot create UserModel from null');
    }

    print('UserModel JSON: $json');

    return UserModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      whatsappNumber: json['whatsapp_number'] as String? ?? '',
      type: json['type'] as String?,
      isActive: json['is_active'] as bool? ?? false,
      medicalFacilityId: json['medical_facility_id'] as int?,
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'] as int?,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'whatsapp_number': whatsappNumber,
      'type': type,
      'is_active': isActive,
      'medical_facility_id': medicalFacilityId,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
