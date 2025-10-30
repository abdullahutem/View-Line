import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/partners/domain/entities/partner_entities.dart';
import 'package:view_line/features/partners/domain/repositories/partners_repository.dart';

class GetPartner {
  final PartnersRepository sectionsRepository;

  GetPartner({required this.sectionsRepository});

  Future<Either<Failure, List<PartnerEntities>>> call() {
    return sectionsRepository.getAllPartners();
  }
}
