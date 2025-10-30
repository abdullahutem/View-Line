import 'package:dartz/dartz.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/errors/expentions.dart';
import 'package:view_line/core/errors/failure.dart';
import 'package:view_line/core/params/params.dart';
import 'package:view_line/features/transactions/data/datasources/transactions_remote_data_source.dart';
import 'package:view_line/features/transactions/domain/entities/transactions_entities.dart';
import 'package:view_line/features/transactions/domain/repositories/transactions_repository.dart';

class TransactionsRepositoryImpl extends TransactionsRepository {
  final NetworkInfo networkInfo;
  final TransactionsRemoteDataSource transactionsRemoteDataSource;
  TransactionsRepositoryImpl({
    required this.networkInfo,
    required this.transactionsRemoteDataSource,
  });
  @override
  Future<Either<Failure, TransactionsEntities>> getTransactionsInfo({
    required TransactionsParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await transactionsRemoteDataSource.getTransactions(
          params: params,
        );
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No internet connection"));
    }
  }
}
