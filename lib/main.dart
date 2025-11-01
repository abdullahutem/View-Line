import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:view_line/core/cache/cache_helper.dart';
import 'package:view_line/core/constants/app_theme.dart';
import 'package:view_line/core/localization/cubit/language_cubit.dart';
import 'package:view_line/core/localization/cubit/language_state.dart';
import 'package:view_line/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:view_line/features/home/presentation/cubit/home_cubit.dart';
import 'package:view_line/features/logout/cubit/logout_cubit.dart';
import 'package:view_line/features/main_page/presentation/screens/main_page.dart';
import 'package:view_line/features/onboarding/cubit/cubit/onboarding_cubit.dart';
import 'package:view_line/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:view_line/features/services/presentation/cubit/services_cubit.dart';
import 'package:view_line/features/transactions/presentation/cubit/transactions_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences via your CacheHelper
  await CacheHelper().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit(cacheHelper: CacheHelper()),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..eitherFailureOrGetTopPerCategory(),
        ),
        BlocProvider(create: (context) => ServicesCubit()..getServices()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => TransactionsCubit()),
        BlocProvider(create: (context) => LogoutCubit()),
      ],
      child: Phoenix(child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, languageState) {
        return MaterialApp(
          locale: languageState.locale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('ar'), Locale('en')],
          title: 'View Line',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: BlocProvider(
            create: (_) => OnboardingCubit()..checkFirstTime(),
            child: const AppNavigator(),
          ),
        );
      },
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
