import 'package:dartz/dartz.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/core/params/params.dart';
import 'package:view_line/features/transactions/domain/entities/transactions_entities.dart';
import 'package:view_line/features/transactions/domain/repositories/transactions_repository.dart';

class GetTransactionsInfo {
  final TransactionsRepository transactionsRepository;

  GetTransactionsInfo({required this.transactionsRepository});

  Future<Either<Failure, TransactionsEntities>> call({
    required TransactionsParams params,
  }) {
    return transactionsRepository.getTransactionsInfo(params: params);
  }
}
