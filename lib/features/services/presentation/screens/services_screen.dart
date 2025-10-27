import 'package:flutter/material.dart';
import 'package:view_line/core/data/mock_data.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/home/presentation/screens/main_service_details_screen.dart';
import 'package:view_line/features/home/presentation/widgets/main_service_card.dart';

class ServicesScreen extends StatelessWidget {
  final mainServices = MockData.getMainServices();
  ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.isArabic ? 'خدماتنا' : 'Our Services'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.69,
            ),
            itemCount: mainServices.length,
            itemBuilder: (context, index) {
              final service = mainServices[index];
              return MainServiceCard(
                service: service,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          MainServiceDetailsScreen(service: service),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
