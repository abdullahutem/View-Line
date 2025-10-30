import 'package:dartz/dartz.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/errors/expentions.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/portfolio/data/datasources/portfolio_remote_data_source.dart';
import 'package:view_line/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:view_line/features/portfolio/domain/repositories/portfolio_sections_repository.dart';

class PortfolioSectionsRepositoryImpl extends PortfolioSectionsRepository {
  final NetworkInfo networkInfo;
  final PortfolioRemoteDataSource portfolioRemoteDataSource;

  PortfolioSectionsRepositoryImpl({
    required this.networkInfo,
    required this.portfolioRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<PortfolioEntities>>> getAllPortfolio() async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await portfolioRemoteDataSource.getPortfolioSections();
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No internet connection"));
    }
  }
}
