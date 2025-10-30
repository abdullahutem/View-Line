import 'package:view_line/features/transactions/data/models/sub_model/transactions_data_model.dart';
import 'package:view_line/features/transactions/domain/entities/transactions_entities.dart';

class TransactionsModel extends TransactionsEntities {
  TransactionsModel({
    required super.success,
    required super.message,
    required super.statusCode,
    required super.data,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['status_code'] ?? 0,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => TransactionsDataModel.fromJson(item))
              .toList() ??
          [],
    );
  }
}
