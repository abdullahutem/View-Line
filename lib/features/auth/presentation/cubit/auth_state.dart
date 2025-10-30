part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final AuthEntities authEntities;

  AuthLoaded({required this.authEntities});
}

final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
