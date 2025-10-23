part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class OnboardingFirstTime extends OnboardingState {}

class OnboardingCompleted extends OnboardingState {}
