import 'package:view_line/core/database/api/api_consumer.dart';
import 'package:view_line/core/database/api/end_points.dart';
import 'package:view_line/features/services/data/models/service.dart';

class ServicesRemoteDataSource {
  final ApiConsumer api;

  ServicesRemoteDataSource({required this.api});
  Future<List<ServiceModel>> getServicesSections() async {
    final response = await api.get("${EndPoints.services}");
    return ServiceModel.listFromJson(response);
  }
}
