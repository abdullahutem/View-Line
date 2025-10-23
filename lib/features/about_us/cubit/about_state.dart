part of 'about_cubit.dart';

abstract class AboutState {
  const AboutState();
}

class AboutInitial extends AboutState {}

class AboutLoading extends AboutState {}

class AboutLoaded extends AboutState {
  final AboutUsModel data;

  const AboutLoaded({required this.data});
}

class AboutError extends AboutState {
  final String message;

  const AboutError({required this.message});
}
