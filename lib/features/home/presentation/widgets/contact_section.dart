import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:view_line/features/home/domain/entities/sub_enities/home_section_entities.dart';
import 'package:view_line/features/home/presentation/widgets/contact_info_card.dart';

class ContactSection extends StatelessWidget {
  final HomeSectionEntities section;
  static const Color primary = Color(0xFFFE910B);
  static const Color secondary = Color(0xFF2B388F);

  const ContactSection({Key? key, required this.section}) : super(key: key);

  IconData _getSocialIcon(String platform) {
    switch (platform.toLowerCase()) {
      case 'facebook':
        return Icons.facebook;
      case 'twitter':
        return Icons.clear; // Use a Twitter icon package
      case 'instagram':
        return Icons.camera_alt;
      case 'linkedin':
        return Icons.business;
      case 'youtube':
        return Icons.play_circle_outline;
      default:
        return Icons.link;
    }
  }

  Future<void> _launchEmail(String email) async {
    final uri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchPhone(String phone) async {
    final uri = Uri.parse('tel:${phone.replaceAll(' ', '')}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final additionalData = section.additionalData;

    final title = isArabic ? section.titleAr : section.titleEn;
    final subtitle = isArabic ? section.subtitleAr : section.subtitleEn;
    final description = isArabic
        ? section.descriptionAr
        : section.descriptionEn;
    final buttonText = isArabic ? section.buttonTextAr : section.buttonTextEn;

    final email = additionalData?.email;
    final phone = additionalData?.phone;
    final address = isArabic
        ? additionalData?.addressAr
        : additionalData?.addressEn;
    final workingHours = isArabic
        ? additionalData?.workingHoursAr
        : additionalData?.workingHoursEn;
    final socialMedia = additionalData?.socialMedia;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, secondary.withOpacity(0.03)],
        ),
      ),
      child: Column(
        children: [
          // Main Content
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              children: [
                // Header
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primary.withOpacity(0.1),
                            secondary.withOpacity(0.1),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.headset_mic_outlined,
                        color: primary,
                        size: 48,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: secondary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      subtitle ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (description != null && description.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 50),

                // Contact Info Cards
                // LayoutBuilder(
                //   builder: (context, constraints) {
                //     if (constraints.maxWidth > 900) {
                //       // Desktop: 4 columns
                //       return Row(
                //         children: [
                //           if (phone != null)
                //             Expanded(
                //               child: Padding(
                //                 padding: EdgeInsets.only(
                //                   right: isArabic ? 0 : 16,
                //                   left: isArabic ? 16 : 0,
                //                 ),
                //                 child: ContactInfoCard(
                //                   icon: Icons.phone_outlined,
                //                   title: isArabic ? 'اتصل بنا' : 'Call Us',
                //                   content: phone,
                //                   primaryColor: primary,
                //                   secondaryColor: secondary,
                //                   onTap: () => _launchPhone(phone),
                //                 ),
                //               ),
                //             ),
                //           if (email != null)
                //             Expanded(
                //               child: Padding(
                //                 padding: EdgeInsets.only(
                //                   right: isArabic ? 0 : 16,
                //                   left: isArabic ? 16 : 0,
                //                 ),
                //                 child: ContactInfoCard(
                //                   icon: Icons.email_outlined,
                //                   title: isArabic ? 'راسلنا' : 'Email Us',
                //                   content: email,
                //                   primaryColor: primary,
                //                   secondaryColor: secondary,
                //                   onTap: () => _launchEmail(email),
                //                 ),
                //               ),
                //             ),
                //           if (address != null)
                //             Expanded(
                //               child: Padding(
                //                 padding: EdgeInsets.only(
                //                   right: isArabic ? 0 : 16,
                //                   left: isArabic ? 16 : 0,
                //                 ),
                //                 child: ContactInfoCard(
                //                   icon: Icons.location_on_outlined,
                //                   title: isArabic ? 'عنواننا' : 'Visit Us',
                //                   content: address,
                //                   primaryColor: primary,
                //                   secondaryColor: secondary,
                //                 ),
                //               ),
                //             ),
                //           if (workingHours != null)
                //             Expanded(
                //               child: ContactInfoCard(
                //                 icon: Icons.access_time_outlined,
                //                 title: isArabic
                //                     ? 'ساعات العمل'
                //                     : 'Working Hours',
                //                 content: workingHours,
                //                 primaryColor: primary,
                //                 secondaryColor: secondary,
                //               ),
                //             ),
                //         ],
                //       );
                //     } else {
                //       // Mobile/Tablet: 2 columns
                //       return Column(
                //         children: [
                //           Row(
                //             children: [
                //               if (phone != null)
                //                 Expanded(
                //                   child: Padding(
                //                     padding: EdgeInsets.only(
                //                       right: isArabic ? 0 : 8,
                //                       left: isArabic ? 8 : 0,
                //                     ),
                //                     child: ContactInfoCard(
                //                       icon: Icons.phone_outlined,
                //                       title: isArabic ? 'اتصل بنا' : 'Call Us',
                //                       content: phone,
                //                       primaryColor: primary,
                //                       secondaryColor: secondary,
                //                       onTap: () => _launchPhone(phone),
                //                     ),
                //                   ),
                //                 ),
                //               if (email != null)
                //                 Expanded(
                //                   child: Padding(
                //                     padding: EdgeInsets.only(
                //                       left: isArabic ? 0 : 8,
                //                       right: isArabic ? 8 : 0,
                //                     ),
                //                     child: ContactInfoCard(
                //                       icon: Icons.email_outlined,
                //                       title: isArabic ? 'راسلنا' : 'Email Us',
                //                       content: email,
                //                       primaryColor: primary,
                //                       secondaryColor: secondary,
                //                       onTap: () => _launchEmail(email),
                //                     ),
                //                   ),
                //                 ),
                //             ],
                //           ),
                //           const SizedBox(height: 16),
                //           Row(
                //             children: [
                //               if (address != null)
                //                 Expanded(
                //                   child: Padding(
                //                     padding: EdgeInsets.only(
                //                       right: isArabic ? 0 : 8,
                //                       left: isArabic ? 8 : 0,
                //                     ),
                //                     child: ContactInfoCard(
                //                       icon: Icons.location_on_outlined,
                //                       title: isArabic ? 'عنواننا' : 'Visit Us',
                //                       content: address,
                //                       primaryColor: primary,
                //                       secondaryColor: secondary,
                //                     ),
                //                   ),
                //                 ),
                //               if (workingHours != null)
                //                 Expanded(
                //                   child: Padding(
                //                     padding: EdgeInsets.only(
                //                       left: isArabic ? 0 : 8,
                //                       right: isArabic ? 8 : 0,
                //                     ),
                //                     child: ContactInfoCard(
                //                       icon: Icons.access_time_outlined,
                //                       title: isArabic
                //                           ? 'ساعات العمل'
                //                           : 'Working Hours',
                //                       content: workingHours,
                //                       primaryColor: primary,
                //                       secondaryColor: secondary,
                //                     ),
                //                   ),
                //                 ),
                //             ],
                //           ),
                //         ],
                //       );
                //     }
                //   },
                // ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final cards = <Widget>[];

                    if (phone != null) {
                      cards.add(
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: ContactInfoCard(
                            icon: Icons.phone_outlined,
                            title: isArabic ? 'اتصل بنا' : 'Call Us',
                            content: phone,
                            primaryColor: primary,
                            secondaryColor: secondary,
                            onTap: () => _launchPhone(phone),
                          ),
                        ),
                      );
                    }

                    if (email != null) {
                      cards.add(
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: ContactInfoCard(
                            icon: Icons.email_outlined,
                            title: isArabic ? 'راسلنا' : 'Email Us',
                            content: email,
                            primaryColor: primary,
                            secondaryColor: secondary,
                            onTap: () => _launchEmail(email),
                          ),
                        ),
                      );
                    }

                    if (address != null) {
                      cards.add(
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: ContactInfoCard(
                            icon: Icons.location_on_outlined,
                            title: isArabic ? 'عنواننا' : 'Visit Us',
                            content: address,
                            primaryColor: primary,
                            secondaryColor: secondary,
                          ),
                        ),
                      );
                    }

                    if (workingHours != null) {
                      cards.add(
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: ContactInfoCard(
                            icon: Icons.access_time_outlined,
                            title: isArabic ? 'ساعات العمل' : 'Working Hours',
                            content: isArabic
                                ? additionalData?.workingHoursEn ?? 'غير متوفر'
                                : additionalData?.workingHoursAr ??
                                      'Not available',
                            // content: isArabic ? 'عنواننا' : 'Visit Us',
                            primaryColor: primary,
                            secondaryColor: secondary,
                          ),
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(children: cards),
                    );
                  },
                ),
                const SizedBox(height: 40),

                // CTA Button
                if (buttonText != null)
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to contact page or show contact form
                      if (section.buttonUrl != null) {
                        // Handle navigation
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      shadowColor: primary.withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          buttonText,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),

                const SizedBox(height: 50),

                // Social Media
                if (socialMedia != null)
                  Column(
                    children: [
                      Text(
                        isArabic ? 'تابعنا على' : 'Follow Us',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: [
                          if (socialMedia.facebook != null)
                            SocialMediaButton(
                              icon: _getSocialIcon('facebook'),
                              url: socialMedia.facebook!,
                              primaryColor: primary,
                            ),
                          if (socialMedia.twitter != null)
                            SocialMediaButton(
                              icon: _getSocialIcon('twitter'),
                              url: socialMedia.twitter!,
                              primaryColor: primary,
                            ),
                          if (socialMedia.instagram != null)
                            SocialMediaButton(
                              icon: _getSocialIcon('instagram'),
                              url: socialMedia.instagram!,
                              primaryColor: primary,
                            ),
                          if (socialMedia.linkedin != null)
                            SocialMediaButton(
                              icon: _getSocialIcon('linkedin'),
                              url: socialMedia.linkedin!,
                              primaryColor: primary,
                            ),
                          if (socialMedia.youtube != null)
                            SocialMediaButton(
                              icon: _getSocialIcon('youtube'),
                              url: socialMedia.youtube!,
                              primaryColor: primary,
                            ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // Footer Divider
          Container(height: 1, color: Colors.grey[200]),
        ],
      ),
    );
  }
}
