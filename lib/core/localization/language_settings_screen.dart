import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/localization/cubit/language_cubit.dart';
import 'package:view_line/core/localization/cubit/language_state.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return Text(
              context.read<LanguageCubit>().isArabic ? 'اللغة' : 'Language',
              style: const TextStyle(fontFamily: 'EXPOARABIC'),
            );
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          final languageCubit = context.read<LanguageCubit>();

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languageCubit.isArabic ? 'اختر اللغة' : 'Select Language',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'EXPOARABIC',
                  ),
                ),
                const SizedBox(height: 24),

                // Arabic Option
                _LanguageCard(
                  title: 'العربية',
                  subtitle: 'Arabic',
                  languageCode: 'ar',
                  isSelected: languageCubit.isArabic,
                  onTap: () => languageCubit.changeLanguage('ar'),
                  icon: Icons.language,
                ),

                const SizedBox(height: 16),

                // English Option
                _LanguageCard(
                  title: 'English',
                  subtitle: 'الإنجليزية',
                  languageCode: 'en',
                  isSelected: languageCubit.isEnglish,
                  onTap: () => languageCubit.changeLanguage('en'),
                  icon: Icons.language,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String languageCode;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;

  const _LanguageCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.languageCode,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.green.withOpacity(0.1)
              : Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.green.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.green : Colors.grey,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'EXPOARABIC',
                      color: isSelected ? Colors.green : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontFamily: 'EXPOARABIC',
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.green, size: 30),
          ],
        ),
      ),
    );
  }
}
