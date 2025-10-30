import 'package:dartz/dartz.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/errors/expentions.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/services/data/datasources/services_remote_data_source.dart';
import 'package:view_line/features/services/domain/entities/services_entities.dart';

import 'package:view_line/features/services/domain/repositories/services_sections_repository.dart';

class ServicesSectionsRepositoryImpl extends ServicesSectionsRepository {
  final NetworkInfo networkInfo;
  final ServicesRemoteDataSource servicesRemoteDataSource;

  ServicesSectionsRepositoryImpl({
    required this.networkInfo,
    required this.servicesRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<ServicesEntities>>> getAllSevices() async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await servicesRemoteDataSource.getServicesSections();
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No internet connection"));
    }
  }
}
