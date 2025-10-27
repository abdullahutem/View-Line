import 'package:bloc/bloc.dart';
import 'package:view_line/core/data/mock_data.dart';
import 'package:view_line/features/about_us/models/about_us_model.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutInitial());

  void loadAboutData() {
    emit(AboutLoading());
    try {
      final aboutData = MockData.getAboutData();
      emit(AboutLoaded(data: aboutData));
    } catch (e) {
      emit(AboutError(message: e.toString()));
    }
  }
}
