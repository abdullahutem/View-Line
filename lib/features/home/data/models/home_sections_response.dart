import 'package:view_line/features/home/data/models/sub_models/home_section.dart';
import 'package:view_line/features/home/domain/entities/home_sections_response_entities.dart';

class HomeSectionsResponse extends HomeSectionsResponseEntities {
  HomeSectionsResponse({
    required super.success,
    required super.message,
    required super.statusCode,
    required super.data,
  });

  factory HomeSectionsResponse.fromJson(Map<String, dynamic> json) {
    return HomeSectionsResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['status_code'] ?? 0,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => HomeSection.fromJson(e))
              .toList() ??
          [],
    );
  }
}
