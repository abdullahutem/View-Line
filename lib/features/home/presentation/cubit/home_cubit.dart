import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/database/api/dio_consumer.dart';
import 'package:view_line/features/home/data/datasources/all_landing_page_sections_remote_data_source.dart';
import 'package:view_line/features/home/data/repository/all_landing_page_sections_repository_impl.dart';
import 'package:view_line/features/home/domain/entities/home_sections_response_entities.dart';
import 'package:view_line/features/home/domain/homecases/Get_all_landing_page_sections.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> eitherFailureOrGetTopPerCategory() async {
    emit(HomeLoading());
    try {
      // Create the use case instance
      final useCase = GetAllLandingPageSections(
        allLandingPageSectionsRepository: AllLandingPageSectionsRepositoryImpl(
          networkInfo: NetworkInfoImpl(
            connectionChecker: DataConnectionChecker(),
          ),
          allLandingPageSectionsDataSource:
              AllLandingPageSectionsRemoteDataSource(
                api: DioConsumer(dio: Dio()),
              ),
        ),
      );

      // Execute the use case and await the result
      final result = await useCase();

      // Handle the Either result
      result.fold(
        // Failure case
        (failure) {
          emit(HomeError(message: failure.toString()));
        },
        // Success case
        (response) {
          emit(HomeLoaded(response: response));
        },
      );
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
