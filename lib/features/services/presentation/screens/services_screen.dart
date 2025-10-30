// lib/features/services/presentation/screens/services_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/services/presentation/cubit/services_cubit.dart';
import 'package:view_line/features/services/presentation/widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServicesCubit()..getServices(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.isArabic ? 'خدماتنا' : 'Our Services'),
        ),
        body: BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            if (state is ServicesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ServicesError) {
              return Center(child: Text(state.message));
            } else if (state is ServicesLoaded) {
              final services = state.services;

              if (services.isEmpty) {
                return Center(
                  child: Text(
                    context.isArabic
                        ? 'لا توجد خدمات متاحة حالياً'
                        : 'No services available currently',
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return ServiceCard(
                      service: service,
                      onTap: () {
                        // Navigate to service details screen here
                      },
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
