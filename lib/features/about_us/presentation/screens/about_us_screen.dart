// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:view_line/core/constants/app_strings.dart';
// import 'package:view_line/core/data/mock_data.dart';
// import 'package:view_line/features/about_us/models/about_us_model.dart';

// class AboutUsScreen extends StatelessWidget {
//   const AboutUsScreen({super.key});

//   static const Color primaryColor = Color(0xFFfe910b);
//   static const Color secondaryColor = Color(0xFF2b388f);

//   @override
//   Widget build(BuildContext context) {
//     final aboutData = MockData.getAboutUsData();
//     final originalTheme = Theme.of(context);
//     final enhancedTheme = originalTheme.copyWith(
//       colorScheme: originalTheme.colorScheme.copyWith(
//         primary: primaryColor,
//         secondary: secondaryColor,
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(title: const Text(AppStrings.aboutUs), centerTitle: true),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Logo
//             Center(
//               child: CircleAvatar(
//                 radius: 55,
//                 backgroundColor: secondaryColor.withOpacity(0.1),
//                 child: ClipOval(
//                   child: Image.asset(
//                     'assets/images/logo.jpeg',
//                     height: 100,
//                     width: 100,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // App Name
//             Text(
//               aboutData.appName,
//               style: enhancedTheme.textTheme.headlineSmall?.copyWith(
//                 fontWeight: FontWeight.bold,
//                 color: secondaryColor,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               aboutData.subtitle,
//               textAlign: TextAlign.center,
//               style: enhancedTheme.textTheme.bodyMedium?.copyWith(
//                 color: Colors.grey[700],
//               ),
//             ),
//             const SizedBox(height: 24),

//             // Content Sections
//             _buildSection(
//               icon: Icons.info_outline,
//               title: 'About View Line',
//               content: aboutData.description,
//               theme: enhancedTheme,
//             ),
//             _buildSection(
//               icon: Icons.visibility_outlined,
//               title: 'Our Vision',
//               content: aboutData.vision,
//               theme: enhancedTheme,
//             ),
//             _buildSection(
//               icon: Icons.message_outlined,
//               title: 'Our Message',
//               content: aboutData.message,
//               theme: enhancedTheme,
//             ),
//             _buildValuesSection(aboutData.values, enhancedTheme),
//             _buildPartnersSection(aboutData.partners, enhancedTheme),
//             _buildTeamSection(aboutData.team, enhancedTheme),

//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSection({
//     required IconData icon,
//     required String title,
//     required String content,
//     required ThemeData theme,
//   }) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(icon, color: theme.colorScheme.primary),
//                 const SizedBox(width: 8),
//                 Text(
//                   title,

//                   style: TextStyle(
//                     color: primaryColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               content,
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 // color: primaryColor,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildValuesSection(List<String> values, ThemeData theme) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.star_rate_rounded, color: theme.colorScheme.primary),
//                 const SizedBox(width: 8),
//                 Text(
//                   'Our Values',
//                   style: TextStyle(
//                     color: primaryColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             ...values.map(
//               (value) => Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 6),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.check_circle_rounded,
//                       color: theme.colorScheme.secondary,
//                       size: 22,
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         value,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPartnersSection(List<Partner> partners, ThemeData theme) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(
//                   Icons.handshake_outlined,
//                   color: theme.colorScheme.primary,
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   'Our Partners',
//                   style: TextStyle(
//                     color: primaryColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             if (partners.isEmpty)
//               const Center(child: Text('No partners to display.'))
//             else
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 160,
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   enableInfiniteScroll: partners.length > 1,
//                   viewportFraction: 0.8,
//                   autoPlayInterval: const Duration(seconds: 3),
//                   autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                 ),
//                 items: partners.map((partner) {
//                   return Builder(
//                     builder: (context) {
//                       return Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 6),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: SvgPicture.asset(
//                                 partner.imageUrl,
//                                 height: 90,
//                                 width: 90,
//                                 fit: BoxFit.contain,
//                                 placeholderBuilder: (context) => Container(
//                                   height: 90,
//                                   width: 90,
//                                   color: theme.colorScheme.surfaceContainer,
//                                   child: const Icon(Icons.image_not_supported),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               partner.name,
//                               style: TextStyle(
//                                 color: primaryColor,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTeamSection(List<TeamMember> team, ThemeData theme) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.group_outlined, color: theme.colorScheme.primary),
//                 const SizedBox(width: 8),
//                 Text(
//                   'Our Team',
//                   style: TextStyle(
//                     color: primaryColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             if (team.isEmpty)
//               const Center(child: Text('No team to display.'))
//             else
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 230,
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   viewportFraction: 0.55,
//                   autoPlayInterval: const Duration(seconds: 3),
//                 ),
//                 items: team.map((member) {
//                   return Builder(
//                     builder: (context) {
//                       return Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(50),
//                               child: Image.asset(
//                                 member.imageUrl,
//                                 height: 100,
//                                 width: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               member.name,
//                               style: TextStyle(
//                                 color: secondaryColor,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 12,
//                               ),
//                             ),
//                             Text(
//                               member.position,
//                               style: TextStyle(
//                                 color: primaryColor,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:view_line/core/constants/app_colors.dart';
import 'package:view_line/features/about_us/cubit/about_cubit.dart';
import 'package:view_line/features/about_us/presentation/widgets/employee_slider.dart';
import 'package:view_line/features/about_us/presentation/widgets/partner_slider.dart';
import 'package:view_line/features/about_us/presentation/widgets/section_header.dart';
import 'package:view_line/features/about_us/presentation/widgets/value_card.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AboutCubit()..loadAboutData(),
      child: Scaffold(
        body: BlocBuilder<AboutCubit, AboutState>(
          builder: (context, state) {
            if (state is AboutLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AboutError) {
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

            if (state is AboutLoaded) {
              final data = state.data;

              return CustomScrollView(
                slivers: [
                  // App Bar
                  SliverAppBar(
                    expandedHeight: 100,
                    pinned: true,
                    backgroundColor: AppColors.primary,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text(
                        'About Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      centerTitle: true,
                      background: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [AppColors.primary, AppColors.secondary],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Content
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),

                          // Logo and App Info
                          _buildHeaderSection(data),

                          const SizedBox(height: 32),

                          // Description Section
                          _buildDescriptionSection(data),

                          const SizedBox(height: 32),

                          // Vision Section
                          _buildVisionSection(data),

                          const SizedBox(height: 32),

                          // Message Section
                          _buildMessageSection(data),

                          const SizedBox(height: 32),

                          // Values Section
                          _buildValuesSection(data),

                          const SizedBox(height: 32),

                          // Partners Section
                          _buildPartnersSection(data),

                          const SizedBox(height: 32),

                          // Employees Section
                          _buildEmployeesSection(data),

                          const SizedBox(height: 32),

                          // Contact Section
                          _buildContactSection(),

                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildHeaderSection(data) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Column(
        children: [
          // Logo
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(
              Icons.flight_takeoff,
              size: 60,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          // App Name
          Text(
            data.appName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            data.subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(data) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Who We Are', icon: Icons.info_outline),
          const SizedBox(height: 16),
          Text(
            data.description,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisionSection(data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.secondary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.visibility,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Our Vision',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            data.vision,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary,
              height: 1.7,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageSection(data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.secondary.withOpacity(0.1),
            AppColors.primary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.secondary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.message, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              const Text(
                'Our Message',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            data.message,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValuesSection(data) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Our Values',
            icon: Icons.favorite_outline,
          ),
          const SizedBox(height: 16),
          ...data.values.asMap().entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ValueCard(value: entry.value, index: entry.key),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildPartnersSection(data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(
            title: 'Our Partners',
            icon: Icons.handshake_outlined,
          ),
        ),
        const SizedBox(height: 16),
        PartnerSlider(partners: data.partners),
      ],
    );
  }

  Widget _buildEmployeesSection(data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(title: 'Our Team', icon: Icons.people_outline),
        ),
        const SizedBox(height: 16),
        EmployeeSlider(employees: data.employees),
      ],
    );
  }

  Widget _buildContactSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.contact_support, size: 48, color: Colors.white),
          const SizedBox(height: 16),
          const Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Have questions? We\'d love to hear from you!',
            style: TextStyle(fontSize: 14, color: Colors.white, height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildContactButton(
                icon: Icons.email,
                label: 'Email',
                onTap: () {},
              ),
              _buildContactButton(
                icon: Icons.phone,
                label: 'Call',
                onTap: () {},
              ),
              _buildContactButton(
                icon: Icons.chat,
                label: 'Chat',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
