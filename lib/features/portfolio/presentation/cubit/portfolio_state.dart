part of 'portfolio_cubit.dart';

abstract class PortfolioState {
  const PortfolioState();
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<PortfolioEntities> portfolio;

  const PortfolioLoaded({required this.portfolio});
}

class PortfolioError extends PortfolioState {
  final String message;

  const PortfolioError({required this.message});
}
