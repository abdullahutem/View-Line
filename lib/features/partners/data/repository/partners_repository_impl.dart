import 'package:dartz/dartz.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/errors/expentions.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/partners/data/datasources/partners_remote_data_source.dart';
import 'package:view_line/features/partners/domain/entities/partner_entities.dart';
import 'package:view_line/features/partners/domain/repositories/partners_repository.dart';

class PartnersRepositoryImpl extends PartnersRepository {
  final NetworkInfo networkInfo;
  final PartnersRemoteDataSource partnersRemoteDataSource;
  PartnersRepositoryImpl({
    required this.networkInfo,
    required this.partnersRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<PartnerEntities>>> getAllPartners() async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await partnersRemoteDataSource.getPartnersSections();
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No internet connection"));
    }
  }
}
