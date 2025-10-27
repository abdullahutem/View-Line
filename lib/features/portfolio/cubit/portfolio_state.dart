part of 'portfolio_cubit.dart';

abstract class PortfolioState {
  const PortfolioState();
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<PortfolioItem> items;

  const PortfolioLoaded({required this.items});
}

class PortfolioError extends PortfolioState {
  final String message;

  const PortfolioError({required this.message});
}
