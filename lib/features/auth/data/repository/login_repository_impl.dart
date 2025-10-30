import 'package:dartz/dartz.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/errors/expentions.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/auth/data/datasources/login_remote_data_source.dart';
import 'package:view_line/features/auth/domain/entities/auth_entities.dart';
import 'package:view_line/features/auth/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final NetworkInfo networkInfo;
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({
    required this.networkInfo,
    required this.loginRemoteDataSource,
  });

  @override
  Future<Either<Failure, AuthEntities>> loginUser(
    String email,
    String password,
  ) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await loginRemoteDataSource.loginUser(email, password);
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No internet connection"));
    }
  }
}
