import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/database/api/dio_consumer.dart';
import 'package:view_line/features/services/data/datasources/services_remote_data_source.dart';
import 'package:view_line/features/services/data/repository/services_sections_repository_impl.dart';
import 'package:view_line/features/services/domain/entities/services_entities.dart';
import 'package:view_line/features/services/domain/sevicescases/get_sevices.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());

  Future<void> getServices() async {
    emit(ServicesLoading());
    try {
      final useCase = GetSevices(
        sectionsRepository: ServicesSectionsRepositoryImpl(
          networkInfo: NetworkInfoImpl(
            connectionChecker: DataConnectionChecker(),
          ),
          servicesRemoteDataSource: ServicesRemoteDataSource(
            api: DioConsumer(dio: Dio()),
          ),
        ),
      );

      final result = await useCase();

      result.fold(
        (failure) => emit(ServicesError(message: failure.toString())),
        (servicesList) => emit(ServicesLoaded(services: servicesList)),
      );
    } catch (e) {
      emit(ServicesError(message: e.toString()));
    }
  }
}
