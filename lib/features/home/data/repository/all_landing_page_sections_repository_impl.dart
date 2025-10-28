import 'package:dartz/dartz.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/errors/expentions.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/home/data/datasources/all_landing_page_sections_remote_data_source.dart';
import 'package:view_line/features/home/domain/entities/home_sections_response_entities.dart';
import 'package:view_line/features/home/domain/repositories/all_landing_page_sections_repository.dart';

class AllLandingPageSectionsRepositoryImpl
    extends AllLandingPageSectionsRepository {
  final NetworkInfo networkInfo;
  final AllLandingPageSectionsRemoteDataSource allLandingPageSectionsDataSource;

  AllLandingPageSectionsRepositoryImpl({
    required this.networkInfo,
    required this.allLandingPageSectionsDataSource,
  });

  @override
  Future<Either<Failure, HomeSectionsResponseEntities>>
  getAllLandingPageSections() async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await allLandingPageSectionsDataSource
            .getAllLandingPageSections();
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No internet connection"));
    }
  }
}
