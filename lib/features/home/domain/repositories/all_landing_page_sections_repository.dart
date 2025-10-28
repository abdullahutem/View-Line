import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/home/domain/entities/home_sections_response_entities.dart';

abstract class AllLandingPageSectionsRepository {
  Future<Either<Failure, HomeSectionsResponseEntities>>
  getAllLandingPageSections();
}
