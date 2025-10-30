import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:view_line/features/portfolio/domain/repositories/portfolio_sections_repository.dart';

class GetPortfolio {
  final PortfolioSectionsRepository portfolioSectionsRepository;

  GetPortfolio({required this.portfolioSectionsRepository});

  Future<Either<Failure, List<PortfolioEntities>>> call() {
    return portfolioSectionsRepository.getAllPortfolio();
  }
}
