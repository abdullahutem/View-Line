part of 'services_cubit.dart';

abstract class ServicesState {
  const ServicesState();
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  final List<ServicesEntities> services;

  const ServicesLoaded({required this.services});
}

class ServicesError extends ServicesState {
  final String message;

  const ServicesError({required this.message});
}
