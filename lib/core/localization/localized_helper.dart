import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/localization/cubit/language_cubit.dart';

extension LocalizedContext on BuildContext {
  /// Returns the localized name based on current language
  String localizedName({required String? nameAr, required String? nameEn}) {
    final languageCubit = read<LanguageCubit>();
    return languageCubit.isArabic
        ? (nameAr ?? nameEn ?? '')
        : (nameEn ?? nameAr ?? '');
  }

  /// Quick access to check if current language is Arabic
  bool get isArabic => read<LanguageCubit>().isArabic;

  /// Quick access to check if current language is English
  bool get isEnglish => read<LanguageCubit>().isEnglish;

  /// Get current language code
  String get currentLanguage => read<LanguageCubit>().currentLanguageCode;
}
