import 'package:view_line/core/cache/cache_helper.dart';
import 'package:view_line/core/database/api/api_consumer.dart';
import 'package:view_line/core/database/api/end_points.dart';
import 'package:view_line/features/auth/data/models/auth_model.dart';
import 'package:view_line/features/auth/domain/entities/auth_entities.dart';

class LoginRemoteDataSource {
  final ApiConsumer api;

  LoginRemoteDataSource({required this.api});
  Future<AuthEntities> loginUser(String email, String password) async {
    final response = await api.post(
      EndPoints.login,
      data: {"email": email, "password": password},
    );
    final authModel = AuthModel.fromJson(response);
    await CacheHelper().saveData(key: ApiKey.token, value: authModel.token);
    return AuthModel.fromJson(response);
  }

  // Future<AuthEntities> loginUser(String email, String password) async {
  //   try {
  //     print('Attempting login with email: $email');

  //     // Try with lowercase first (standard REST convention)
  //     final response = await api.post(
  //       EndPoints.login,
  //       data: {"email": email, "password": password},
  //     );

  //     print('Login Response: $response');

  //     if (response == null) {
  //       throw ServerException(
  //         ErrorModel(status: 500, errorMessage: 'No response from server'),
  //       );
  //     }
  //     final authModel = AuthModel.fromJson(response);
  //     await CacheHelper().saveData(key: ApiKey.token, value: authModel.token);

  //     return AuthModel.fromJson(response as Map<String, dynamic>);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
