import 'package:dio/dio.dart';
import 'package:view_line/core/database/api/api_consumer.dart';
import 'package:view_line/core/database/api/api_interceptors.dart';
import 'package:view_line/core/database/api/end_points.dart';
import 'package:view_line/core/errors/error_model.dart';
import 'package:view_line/core/errors/expentions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15)
      ..headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }
      ..validateStatus = (status) {
        return status! < 500; // Don't throw for client errors (4xx)
      };
    // Add interceptor to log requests
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
    dio.interceptors.add(ApiInterceptors());
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      print('Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');
      print('Response Type: ${response.data.runtimeType}');

      // Check if response was successful
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Handle null or non-Map responses
        if (response.data == null) {
          throw ServerException(
            ErrorModel(
              status: response.statusCode ?? 500,
              errorMessage: 'Empty response from server',
            ),
          );
        }

        if (response.data is! Map<String, dynamic>) {
          throw ServerException(
            ErrorModel(
              status: response.statusCode ?? 500,
              errorMessage: 'Invalid response format from server',
            ),
          );
        }

        return response.data;
      } else {
        // Handle error responses
        String errorMessage = 'An error occurred';

        if (response.data != null) {
          if (response.data is Map<String, dynamic>) {
            errorMessage =
                response.data['message'] ??
                response.data['error'] ??
                errorMessage;
          } else if (response.data is String) {
            errorMessage = response.data;
          }
        }

        throw ServerException(
          ErrorModel(
            status: response.statusCode ?? 500,
            errorMessage: errorMessage,
          ),
        );
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('DioException Response: ${e.response?.data}');

      String errorMessage = 'An error occurred';

      if (e.response?.data != null) {
        if (e.response!.data is Map<String, dynamic>) {
          errorMessage =
              e.response!.data['message'] ??
              e.response!.data['error'] ??
              errorMessage;
        } else if (e.response!.data is String) {
          errorMessage = e.response!.data;
        }
      } else {
        errorMessage = e.message ?? errorMessage;
      }

      throw ServerException(
        ErrorModel(
          status: e.response?.statusCode ?? 500,
          errorMessage: errorMessage,
        ),
      );
    }
  }

  //!POST
  // @override
  // Future post(
  //   String path, {
  //   dynamic data,
  //   Map<String, dynamic>? queryParameters,
  //   bool isFormData = false,
  // }) async {
  //   try {
  //     dio.post(
  //       path,
  //       data: isFormData ? FormData.fromMap(data) : data,
  //       queryParameters: queryParameters,
  //     );
  //   } on DioException catch (e) {
  //     handleDioException(e);
  //   }
  // }

  //!GET
  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  //!DELETE
  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  //!PATCH
  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      var res = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
