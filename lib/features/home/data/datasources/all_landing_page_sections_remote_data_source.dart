import 'package:view_line/core/database/api/api_consumer.dart';
import 'package:view_line/core/database/api/end_points.dart';
import 'package:view_line/features/home/data/models/home_sections_response.dart';

class AllLandingPageSectionsRemoteDataSource {
  final ApiConsumer api;

  AllLandingPageSectionsRemoteDataSource({required this.api});
  Future<HomeSectionsResponse> getAllLandingPageSections() async {
    final response = await api.get("${EndPoints.getAllLandingPageSections}");
    return HomeSectionsResponse.fromJson(response);
  }
}
