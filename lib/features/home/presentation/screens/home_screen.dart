import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/core/constants/app_strings.dart';
import 'package:view_line/core/data/mock_data.dart';
import 'package:view_line/features/home/cubit/home_cubit.dart';
import 'package:view_line/features/home/presentation/screens/main_service_details_screen.dart';
import 'package:view_line/features/home/presentation/widgets/ad_carousel.dart';
import 'package:view_line/features/home/presentation/widgets/main_service_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..loadAdvertisements(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.flight_takeoff, color: AppColors.primary),
              const SizedBox(width: 8),
              const Text(AppStrings.appName),
            ],
          ),
          centerTitle: false,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: AppColors.error),
                ),
              );
            }

            if (state is HomeLoaded) {
              final mainServices = MockData.getMainServices(); // Add this

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppStrings.searchHint,
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.tune),
                            onPressed: () {
                              // Add filter functionality
                            },
                          ),
                        ),
                        onChanged: (value) {
                          // Add search functionality
                        },
                      ),
                    ),

                    // Advertisement Carousel
                    const SizedBox(height: 8),
                    AdCarousel(advertisements: state.advertisements),

                    const SizedBox(height: 32),

                    // OUR MAIN SERVICES SECTION - NEW
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Our Main Services',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Discover our comprehensive travel solutions',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Main Services Grid
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  builder: (_) => MainServiceDetailsScreen(
                                    service: service,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Popular Destinations Section (existing code)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Popular Destinations',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),

                    // Quick Categories (existing code)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildCategoryCard(
                              icon: Icons.beach_access,
                              title: 'Beach',
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildCategoryCard(
                              icon: Icons.landscape,
                              title: 'Mountain',
                              color: AppColors.secondary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildCategoryCard(
                              icon: Icons.location_city,
                              title: 'City',
                              color: AppColors.success,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Special Offers Banner (existing code)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.secondary,
                              AppColors.secondary.withOpacity(0.7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Special Offer!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Get up to 30% off on selected packages',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: AppColors.secondary,
                                    ),
                                    child: const Text('Explore Now'),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.card_giftcard,
                              size: 60,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
