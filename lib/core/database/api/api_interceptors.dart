import 'package:dio/dio.dart';
import 'package:view_line/core/cache/cache_helper.dart';
import 'package:view_line/core/database/api/end_points.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper().getDataString(key: ApiKey.token);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = "Bearer $token";
      options.headers['Accept'] = 'application/json';
    }
    super.onRequest(options, handler);
  }
}
