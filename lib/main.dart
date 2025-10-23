import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/constants/app_theme.dart';
import 'package:view_line/features/main_page/presentation/screens/main_page.dart';
import 'package:view_line/features/onboarding/cubit/cubit/onboarding_cubit.dart';
import 'package:view_line/features/onboarding/presentation/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Line',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      home: BlocProvider(
        create: (_) => OnboardingCubit()..checkFirstTime(),
        child: const AppNavigator(),
      ),
    );
  }
}

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is OnboardingFirstTime) {
          return const OnboardingScreen();
        }

        if (state is OnboardingCompleted) {
          return const MainPage();
        }

        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
