import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/cache/cache_helper.dart';

import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final CacheHelper cacheHelper;

  LanguageCubit({required this.cacheHelper})
    : super(LanguageInitial(_getInitialLocale(cacheHelper)));

  static Locale _getInitialLocale(CacheHelper cacheHelper) {
    final savedLanguage = cacheHelper.getData(key: "language") ?? 'ar';
    return Locale(savedLanguage);
  }

  String get currentLanguageCode => state.locale.languageCode;

  bool get isArabic => currentLanguageCode == 'ar';
  bool get isEnglish => currentLanguageCode == 'en';

  Future<void> changeLanguage(String languageCode) async {
    if (languageCode == currentLanguageCode) return;

    await cacheHelper.saveData(key: "language", value: languageCode);
    emit(LanguageChanged(Locale(languageCode)));
  }

  Future<void> toggleLanguage() async {
    final newLanguage = isArabic ? 'en' : 'ar';
    await changeLanguage(newLanguage);
  }
}
