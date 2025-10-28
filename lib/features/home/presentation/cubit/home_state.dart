part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();

  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeSectionsResponseEntities response;

  const HomeLoaded({required this.response});
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
