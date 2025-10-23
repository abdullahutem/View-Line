import 'package:bloc/bloc.dart';
import 'package:view_line/core/data/mock_data.dart';
import 'package:view_line/features/services/models/service.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());

  void loadServices() {
    emit(ServicesLoading());
    try {
      final services = MockData.getServices();
      emit(ServicesLoaded(services: services));
    } catch (e) {
      emit(ServicesError(message: e.toString()));
    }
  }
}
