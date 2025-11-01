import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/database/api/dio_consumer.dart';
import 'package:view_line/features/logout/data/datasources/logout_remote_data_source.dart';
import 'package:view_line/features/logout/data/model/logout_model.dart';
import 'package:view_line/features/logout/data/repository/logout_repository_impl.dart';
import 'package:view_line/features/logout/domain/logoutcases/get_logout.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  Future<void> getLogout() async {
    emit(LogoutLoading());
    try {
      final useCase = GetLogout(
        logoutRepository: LogoutRepositoryImpl(
          networkInfo: NetworkInfoImpl(
            connectionChecker: DataConnectionChecker(),
          ),
          logoutRemoteDataSource: LogoutRemoteDataSource(
            api: DioConsumer(dio: Dio()),
          ),
        ),
      );

      final result = await useCase();

      result.fold(
        (failure) => emit(LogoutError(message: failure.toString())),
        (partner) => emit(LogoutLoaded(logout: partner)),
      );
    } catch (e) {
      emit(LogoutError(message: e.toString()));
    }
  }
}
