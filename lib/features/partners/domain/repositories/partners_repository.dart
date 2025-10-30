import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/partners/domain/entities/partner_entities.dart';

abstract class PartnersRepository {
  Future<Either<Failure, List<PartnerEntities>>> getAllPartners();
}
