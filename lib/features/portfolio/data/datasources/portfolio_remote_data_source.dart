import 'package:view_line/core/database/api/api_consumer.dart';
import 'package:view_line/core/database/api/end_points.dart';
import 'package:view_line/features/portfolio/data/models/portfolio_model.dart';

class PortfolioRemoteDataSource {
  final ApiConsumer api;

  PortfolioRemoteDataSource({required this.api});
  Future<List<PortfolioModel>> getPortfolioSections() async {
    final response = await api.get("${EndPoints.portfolio}");
    return PortfolioModel.listFromJson(response);
  }
}
