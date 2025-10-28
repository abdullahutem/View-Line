import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/home/domain/entities/home_sections_response_entities.dart';
import 'package:view_line/features/home/domain/repositories/all_landing_page_sections_repository.dart';

class GetAllLandingPageSections {
  final AllLandingPageSectionsRepository allLandingPageSectionsRepository;

  GetAllLandingPageSections({required this.allLandingPageSectionsRepository});

  Future<Either<Failure, HomeSectionsResponseEntities>> call() {
    return allLandingPageSectionsRepository.getAllLandingPageSections();
  }
}
