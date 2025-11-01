import 'package:view_line/core/database/api/api_consumer.dart';
import 'package:view_line/core/database/api/end_points.dart';
import 'package:view_line/features/logout/data/model/logout_model.dart';

class LogoutRemoteDataSource {
  final ApiConsumer api;
  LogoutRemoteDataSource({required this.api});
  Future<LogoutModel> logoutUser() async {
    final response = await api.get(EndPoints.login);
    return LogoutModel.fromJson(response);
  }
}
