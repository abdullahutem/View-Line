import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/database/api/dio_consumer.dart';
import 'package:view_line/core/params/params.dart';
import 'package:view_line/features/transactions/data/datasources/transactions_remote_data_source.dart';
import 'package:view_line/features/transactions/data/repository/transactions_repository_impl.dart';
import 'package:view_line/features/transactions/domain/entities/transactions_entities.dart';
import 'package:view_line/features/transactions/domain/transactionscases/get_transactions_info.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());

  Future<void> eitherFailureOrTransactions(String passport) async {
    emit(TransactionsLoading());
    try {
      final response = await GetTransactionsInfo(
        transactionsRepository: TransactionsRepositoryImpl(
          networkInfo: NetworkInfoImpl(
            connectionChecker: DataConnectionChecker(),
          ),
          transactionsRemoteDataSource: TransactionsRemoteDataSource(
            api: DioConsumer(dio: Dio()),
          ),
        ),
      ).call(params: TransactionsParams(id: passport.toString()));
      response.fold(
        (failure) => emit(TransactionsError(message: failure.toString())),
        (teamMembers) =>
            emit(TransactionsLoaded(transactionsEntities: teamMembers)),
      );
    } catch (e) {
      emit(TransactionsError(message: e.toString()));
    }
  }
}
