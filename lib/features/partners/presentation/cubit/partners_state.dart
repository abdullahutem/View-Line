part of 'partners_cubit.dart';

abstract class PartnersState {
  const PartnersState();
}

final class PartnersInitial extends PartnersState {}

class PartnersLoading extends PartnersState {}

class PartnersLoaded extends PartnersState {
  final List<PartnerEntities> partners;

  const PartnersLoaded({required this.partners});
}

class PartnersError extends PartnersState {
  final String message;

  const PartnersError({required this.message});
}
