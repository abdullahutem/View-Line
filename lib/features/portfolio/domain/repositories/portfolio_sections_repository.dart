import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/portfolio/domain/entities/portfolio_entities.dart';

abstract class PortfolioSectionsRepository {
  Future<Either<Failure, List<PortfolioEntities>>> getAllPortfolio();
}
