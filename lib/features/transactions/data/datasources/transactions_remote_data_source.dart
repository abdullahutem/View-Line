import 'package:view_line/core/database/api/api_consumer.dart';
import 'package:view_line/core/database/api/end_points.dart';
import 'package:view_line/core/params/params.dart';
import 'package:view_line/features/transactions/data/models/transactions_model.dart';

class TransactionsRemoteDataSource {
  final ApiConsumer api;

  TransactionsRemoteDataSource({required this.api});
  Future<TransactionsModel> getTransactions({
    required TransactionsParams params,
  }) async {
    final response = await api.get("${EndPoints.transactions}/${params.id}");
    return TransactionsModel.fromJson(response);
  }
}
