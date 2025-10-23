import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/constants/app_strings.dart';
import 'package:view_line/features/services/cubit/services_cubit.dart';
import 'package:view_line/features/services/presentation/screens/service_details_screen.dart';
import 'package:view_line/features/services/presentation/widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServicesCubit()..loadServices(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.services),
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                // Add filter functionality
              },
            ),
          ],
        ),
        body: BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            if (state is ServicesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ServicesError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 60,
                      color: AppColors.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: AppColors.error),
                    ),
                  ],
                ),
              );
            }

            if (state is ServicesLoaded) {
              if (state.services.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.travel_explore,
                        size: 80,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No services available',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.services.length,
                itemBuilder: (context, index) {
                  final service = state.services[index];
                  return ServiceCard(
                    service: service,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ServiceDetailsScreen(service: service),
                        ),
                      );
                    },
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
