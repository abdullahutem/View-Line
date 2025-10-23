import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static const String _isFirstTimeKey = 'isFirstTime';

  Future<void> checkFirstTime() async {
    emit(OnboardingLoading());
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool(_isFirstTimeKey) ?? true;

    if (isFirstTime) {
      emit(OnboardingFirstTime());
    } else {
      emit(OnboardingCompleted());
    }
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstTimeKey, false);
    emit(OnboardingCompleted());
  }
}
