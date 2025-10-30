import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:view_line/core/connection/network_info.dart';
import 'package:view_line/core/database/api/dio_consumer.dart';
import 'package:view_line/features/partners/data/datasources/partners_remote_data_source.dart';
import 'package:view_line/features/partners/data/repository/partners_repository_impl.dart';
import 'package:view_line/features/partners/domain/entities/partner_entities.dart';
import 'package:view_line/features/partners/domain/partnerscases/get_partner.dart';

part 'partners_state.dart';

class PartnersCubit extends Cubit<PartnersState> {
  PartnersCubit() : super(PartnersInitial());

  Future<void> getPartners() async {
    emit(PartnersLoading());
    try {
      final useCase = GetPartner(
        sectionsRepository: PartnersRepositoryImpl(
          networkInfo: NetworkInfoImpl(
            connectionChecker: DataConnectionChecker(),
          ),
          partnersRemoteDataSource: PartnersRemoteDataSource(
            api: DioConsumer(dio: Dio()),
          ),
        ),
      );

      final result = await useCase();

      result.fold(
        (failure) => emit(PartnersError(message: failure.toString())),
        (partner) => emit(PartnersLoaded(partners: partner)),
      );
    } catch (e) {
      emit(PartnersError(message: e.toString()));
    }
  }
}
