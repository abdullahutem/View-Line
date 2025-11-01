import 'package:dartz/dartz.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/errors/expentions.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/Logout/domain/repositories/Logout_repository.dart';
import 'package:view_line/features/logout/data/datasources/logout_remote_data_source.dart';
import 'package:view_line/features/logout/data/model/logout_model.dart';

class LogoutRepositoryImpl extends LogoutRepository {
  final NetworkInfo networkInfo;
  final LogoutRemoteDataSource logoutRemoteDataSource;
  LogoutRepositoryImpl({
    required this.networkInfo,
    required this.logoutRemoteDataSource,
  });
  @override
  Future<Either<Failure, LogoutModel>> getAllLogout() async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await logoutRemoteDataSource.logoutUser();
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No internet connection"));
    }
  }
}
