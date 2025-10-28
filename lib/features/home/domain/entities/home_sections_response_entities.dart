import 'package:view_line/features/home/domain/entities/sub_enities/home_section_entities.dart';

class HomeSectionsResponseEntities {
  final bool success;
  final String message;
  final int statusCode;
  final List<HomeSectionEntities> data;

  HomeSectionsResponseEntities({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory HomeSectionsResponseEntities.fromJson(Map<String, dynamic> json) {
    return HomeSectionsResponseEntities(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['status_code'] ?? 0,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => HomeSectionEntities.fromJson(e))
              .toList() ??
          [],
    );
  }
}
