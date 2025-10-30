part of 'transactions_cubit.dart';

@immutable
sealed class TransactionsState {}

final class TransactionsInitial extends TransactionsState {}

final class TransactionsLoading extends TransactionsState {}

final class TransactionsLoaded extends TransactionsState {
  final TransactionsEntities transactionsEntities;

  TransactionsLoaded({required this.transactionsEntities});
}

final class TransactionsError extends TransactionsState {
  final String message;

  TransactionsError({required this.message});
}
