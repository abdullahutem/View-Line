part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutLoaded extends LogoutState {
  final LogoutModel logout;

  LogoutLoaded({required this.logout});
}

class LogoutError extends LogoutState {
  final String message;

  LogoutError({required this.message});
}
