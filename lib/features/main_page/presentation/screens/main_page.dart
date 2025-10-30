import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/about_us/presentation/screens/about_us_screen.dart';
import 'package:view_line/features/home/presentation/screens/home_screen.dart';
import 'package:view_line/features/main_page/cubit/navigation_cubit.dart';
import 'package:view_line/features/portfolio/presentation/screens/portfolio_screen.dart';
import 'package:view_line/features/services/presentation/screens/services_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.currentIndex,
              children: [
                HomeScreen(),
                ServicesScreen(),
                PortfolioScreen(), // Add Portfolio Screen
                AboutUsScreen(),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: state.currentIndex,
                onTap: (index) =>
                    context.read<NavigationCubit>().changeTab(index),
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.textSecondary,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: context.isArabic ? 'الرئيسية' : 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.travel_explore_outlined),
                    activeIcon: Icon(Icons.travel_explore),
                    label: context.isArabic ? 'خدماتنا' : 'Our Services',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo_library_outlined), // Portfolio icon
                    activeIcon: Icon(Icons.photo_library),
                    label: context.isArabic ? 'أعمالنا' : 'Portfolio',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info_outline),
                    activeIcon: Icon(Icons.info),
                    label: context.isArabic ? 'من نحن' : 'About Us',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
