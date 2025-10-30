import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/services/domain/entities/services_entities.dart';
import 'package:view_line/features/services/domain/repositories/services_sections_repository.dart';

class GetSevices {
  final ServicesSectionsRepository sectionsRepository;

  GetSevices({required this.sectionsRepository});

  Future<Either<Failure, List<ServicesEntities>>> call() {
    return sectionsRepository.getAllSevices();
  }
}
