import 'package:view_line/features/transactions/domain/entities/sub_entities/transactions_data_entities.dart';

class TransactionsEntities {
  final bool success;
  final String message;
  final int statusCode;
  final List<TransactionsDataEntities> data;

  TransactionsEntities({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });
}
