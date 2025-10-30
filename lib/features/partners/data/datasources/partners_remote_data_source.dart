import 'package:view_line/core/database/api/api_consumer.dart';
import 'package:view_line/core/database/api/end_points.dart';
import 'package:view_line/features/partners/data/models/partner_model.dart';

class PartnersRemoteDataSource {
  final ApiConsumer api;

  PartnersRemoteDataSource({required this.api});
  Future<List<PartnerModel>> getPartnersSections() async {
    final response = await api.get("${EndPoints.partners}");
    return PartnerModel.listFromJson(response);
  }
}
