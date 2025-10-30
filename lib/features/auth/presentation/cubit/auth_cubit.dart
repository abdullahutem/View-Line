import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:view_line/core/cache/cache_helper.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/database/api/dio_consumer.dart';
import 'package:view_line/core/database/api/end_points.dart';
import 'package:view_line/features/auth/data/datasources/login_remote_data_source.dart';
import 'package:view_line/features/auth/data/models/auth_model.dart';
import 'package:view_line/features/auth/data/repository/login_repository_impl.dart';
import 'package:view_line/features/auth/domain/entities/auth_entities.dart';
import 'package:view_line/features/auth/domain/logincases/login_user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    print(
      'Login called with email: "$email", password length: ${password.length}',
    );

    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: "https://vwline.com/api/v1", // Your base URL
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      final response = await LoginUser(
        loginRepository: LoginRepositoryImpl(
          networkInfo: NetworkInfoImpl(
            connectionChecker: DataConnectionChecker(),
          ),
          loginRemoteDataSource: LoginRemoteDataSource(
            api: DioConsumer(dio: dio),
          ),
        ),
      ).call(email, password);

      response.fold(
        (failure) => emit(AuthError(message: failure.errMessage)),
        (auth) => emit(AuthLoaded(authEntities: auth)),
      );
    } catch (e) {
      print('Cubit Error: $e');
      emit(AuthError(message: "Login failed: ${e.toString()}"));
    }
  }
}
