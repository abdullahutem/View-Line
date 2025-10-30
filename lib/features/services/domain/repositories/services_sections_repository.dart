import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/services/domain/entities/services_entities.dart';

abstract class ServicesSectionsRepository {
  Future<Either<Failure, List<ServicesEntities>>> getAllSevices();
}
