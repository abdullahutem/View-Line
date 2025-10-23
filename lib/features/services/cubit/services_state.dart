part of 'services_cubit.dart';

abstract class ServicesState {
  const ServicesState();

  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  final List<Service> services;

  const ServicesLoaded({required this.services});

  @override
  List<Object> get props => [services];
}

class ServicesError extends ServicesState {
  final String message;

  const ServicesError({required this.message});

  @override
  List<Object> get props => [message];
}
