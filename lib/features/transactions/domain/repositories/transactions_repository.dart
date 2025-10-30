import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/core/params/params.dart';
import 'package:view_line/features/transactions/domain/entities/transactions_entities.dart';

abstract class TransactionsRepository {
  Future<Either<Failure, TransactionsEntities>> getTransactionsInfo({
    required TransactionsParams params,
  });
}
