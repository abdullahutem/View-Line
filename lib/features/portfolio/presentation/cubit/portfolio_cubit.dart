import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/database/api/dio_consumer.dart';
import 'package:view_line/features/portfolio/data/datasources/portfolio_remote_data_source.dart';
import 'package:view_line/features/portfolio/data/repository/portfolio_sections_repository_impl.dart';
import 'package:view_line/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:view_line/features/portfolio/domain/porttfoliocases/get_portfolio.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(PortfolioInitial());
  Future<void> getProtfolio() async {
    emit(PortfolioLoading());
    try {
      final useCase = GetPortfolio(
        portfolioSectionsRepository: PortfolioSectionsRepositoryImpl(
          networkInfo: NetworkInfoImpl(
            connectionChecker: DataConnectionChecker(),
          ),
          portfolioRemoteDataSource: PortfolioRemoteDataSource(
            api: DioConsumer(dio: Dio()),
          ),
        ),
      );

      final result = await useCase();

      result.fold(
        (failure) => emit(PortfolioError(message: failure.toString())),
        (servicesList) => emit(PortfolioLoaded(portfolio: servicesList)),
      );
    } catch (e) {
      emit(PortfolioError(message: e.toString()));
    }
  }
}
