import 'package:bloc/bloc.dart';
import 'package:view_line/core/data/mock_data.dart';
import 'package:view_line/features/home/models/advertisement.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void loadAdvertisements() {
    emit(HomeLoading());
    try {
      final advertisements = MockData.getAdvertisements();
      emit(HomeLoaded(advertisements: advertisements));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
