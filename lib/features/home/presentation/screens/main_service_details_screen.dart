// import 'package:flutter/material.dart';
// import 'package:view_line/core/constants/app_colors.dart';
// import 'package:view_line/core/localization/localized_helper.dart';

// class MainServiceDetailsScreen extends StatelessWidget {
//   final MainService service;

//   const MainServiceDetailsScreen({super.key, required this.service});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // Hero Image App Bar
//           SliverAppBar(
//             expandedHeight: 300,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 6,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.6),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   context.isArabic ? service.titleAr : service.titleEn,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               background: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Image.network(
//                     service.imageUrl,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         color: AppColors.secondary.withOpacity(0.2),
//                         child: Icon(
//                           service.icon,
//                           size: 100,
//                           color: AppColors.primary,
//                         ),
//                       );
//                     },
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Colors.transparent,
//                           Colors.black.withOpacity(0.7),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // Content
//           SliverToBoxAdapter(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Header Section
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   color: Colors.white,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: AppColors.primary.withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Icon(
//                               service.icon,
//                               size: 32,
//                               color: AppColors.primary,
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   context.isArabic
//                                       ? service.titleAr
//                                       : service.titleEn,
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: AppColors.textPrimary,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   context.isArabic
//                                       ? service.subtitleAr
//                                       : service.subtitleEn,
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     color: AppColors.textSecondary,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         context.isArabic
//                             ? service.descriptionAr
//                             : service.descriptionEn,
//                         style: const TextStyle(
//                           fontSize: 12,
//                           color: AppColors.textSecondary,
//                           height: 1.6,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 12),

//                 // Overview Section
//                 _buildSection(
//                   title: context.isArabic ? 'نظرة عامة' : 'Overview',
//                   icon: Icons.info_outline,
//                   child: Text(
//                     context.isArabic ? service.overviewAr : service.overviewEn,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: AppColors.textSecondary,
//                       height: 1.7,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 12),

//                 // Available Packages Section
//                 _buildPackagesSection(service.packages, context),

//                 const SizedBox(height: 12),

//                 // Requirements Section
//                 _buildListSection(
//                   title: context.isArabic ? 'المتطلبات' : 'Requirements',
//                   icon: Icons.checklist,
//                   items: context.isArabic
//                       ? service.requirementsAr
//                       : service.requirementsEn,
//                   iconColor: AppColors.secondary,
//                 ),

//                 const SizedBox(height: 12),

//                 // Cost Information Section
//                 _buildSection(
//                   title: context.isArabic
//                       ? 'معلومات التكلفة'
//                       : 'Cost Information',
//                   icon: Icons.payments_outlined,
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: AppColors.primary.withOpacity(0.05),
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                         color: AppColors.primary.withOpacity(0.2),
//                       ),
//                     ),
//                     child: Text(
//                       context.isArabic
//                           ? service.costInformationAr
//                           : service.costInformationEn,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: AppColors.textSecondary,
//                         height: 1.7,
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 12),

//                 // Contact & Booking Section
//                 _buildContactSection(
//                   context.isArabic
//                       ? service.contactInstructionsAr
//                       : service.contactInstructionsEn,
//                   context,
//                 ),

//                 const SizedBox(height: 100),
//               ],
//             ),
//           ),
//         ],
//       ),

//       // Floating Action Button
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           _showBookingDialog(context);
//         },
//         backgroundColor: AppColors.primary,
//         icon: const Icon(Icons.phone, color: Colors.white),
//         label: Text(
//           context.isArabic ? 'اتصل بنا' : 'Contact Us',
//           style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
//         ),
//       ),

//       // Bottom Bar
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 10,
//               offset: const Offset(0, -5),
//             ),
//           ],
//         ),
//         child: SafeArea(
//           child: Row(
//             children: [
//               Expanded(
//                 child: OutlinedButton.icon(
//                   onPressed: () {
//                     _showInfoDialog(
//                       context,
//                       context.isArabic
//                           ? 'مزيد من المعلومات'
//                           : 'More Information',
//                       context.isArabic
//                           ? "للحصول على معلومات مفصلة حول خدمة ${service.titleAr}، يرجى الاتصال بفريق خدمة العملاء لدينا. نحن هنا لمساعدتك على مدار الساعة طوال أيام الأسبوع!"
//                           : 'For detailed information about ${service.titleEn}, please contact our customer service team. We\'re here to help you 24/7!',
//                     );
//                   },
//                   icon: const Icon(Icons.info_outline),
//                   label: Text(
//                     context.isArabic ? 'مزيد من المعلومات' : 'More Info',
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     side: const BorderSide(color: AppColors.primary),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     _showBookingDialog(context);
//                   },
//                   icon: const Icon(Icons.book_online),
//                   label: Text(context.isArabic ? 'احجز الآن' : 'Book Now'),
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSection({
//     required String title,
//     required IconData icon,
//     required Widget child,
//   }) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: AppColors.primary.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Icon(icon, color: AppColors.primary, size: 24),
//               ),
//               const SizedBox(width: 12),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           child,
//         ],
//       ),
//     );
//   }

//   Widget _buildListSection({
//     required String title,
//     required IconData icon,
//     required List<String> items,
//     required Color iconColor,
//   }) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: iconColor.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Icon(icon, color: iconColor, size: 24),
//               ),
//               const SizedBox(width: 12),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           ...items.map(
//             (item) => Padding(
//               padding: const EdgeInsets.only(bottom: 12),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(top: 4),
//                     padding: const EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       color: iconColor.withOpacity(0.1),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(Icons.check, size: 16, color: iconColor),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Text(
//                       item,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: AppColors.textSecondary,
//                         height: 1.5,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPackagesSection(
//     List<ServicePackage> packages,
//     BuildContext context,
//   ) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: AppColors.success.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Icon(
//                   Icons.card_giftcard,
//                   color: AppColors.success,
//                   size: 24,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Text(
//                 context.isArabic ? 'الباقات المتاحة' : 'Available Packages',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           ...packages.map((package) => _buildPackageCard(package, context)),
//         ],
//       ),
//     );
//   }

//   Widget _buildPackageCard(ServicePackage package, BuildContext context) {
//     final colors = [AppColors.primary, AppColors.secondary, AppColors.success];
//     // final color = colors[packages.indexOf(package) % colors.length];
//     final color = AppColors.primary;

//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(color: color.withOpacity(0.3), width: 2),
//         borderRadius: BorderRadius.circular(12),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [color.withOpacity(0.05), color.withOpacity(0.02)],
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       context.isArabic ? package.nameAr : package.nameEn,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: color,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       context.isArabic
//                           ? package.descriptionAr
//                           : package.descriptionEn,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: AppColors.textSecondary,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 6,
//                 ),
//                 decoration: BoxDecoration(
//                   color: color,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   context.isArabic
//                       ? "إبتدا من ${package.price}"
//                       : "From ${package.price}",
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           const Divider(),
//           const SizedBox(height: 8),
//           ...context.isArabic
//               ? package.featuresAr
//                     .map(
//                       (feature) => Padding(
//                         padding: const EdgeInsets.only(bottom: 8),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Icon(Icons.check_circle, size: 18, color: color),
//                             const SizedBox(width: 8),
//                             Expanded(
//                               child: Text(
//                                 feature,
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: AppColors.textSecondary,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                     .toList()
//               : package.featuresEn
//                     .map(
//                       (feature) => Padding(
//                         padding: const EdgeInsets.only(bottom: 8),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Icon(Icons.check_circle, size: 18, color: color),
//                             const SizedBox(width: 8),
//                             Expanded(
//                               child: Text(
//                                 feature,
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   color: AppColors.textSecondary,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                     .toList(),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactSection(String instructions, BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [AppColors.secondary, AppColors.secondary.withOpacity(0.8)],
//         ),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.secondary.withOpacity(0.3),
//             blurRadius: 15,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             // Remove const here
//             children: [
//               const Icon(Icons.support_agent, color: Colors.white, size: 28),
//               const SizedBox(width: 12),
//               Text(
//                 context.isArabic
//                     ? "اتصل واحجز"
//                     : 'Contact & Booking', // Add Arabic text
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             instructions,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.white,
//               height: 2,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               Expanded(
//                 child: _buildContactIconButton(
//                   icon: Icons.phone,
//                   label: context.isArabic
//                       ? 'اتصال'
//                       : 'Call', // Localize button labels too
//                   onTap: () {},
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: _buildContactIconButton(
//                   icon: Icons.email,
//                   label: context.isArabic ? 'بريد' : 'Email',
//                   onTap: () {},
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: _buildContactIconButton(
//                   icon: Icons.chat,
//                   label: context.isArabic ? 'دردشة' : 'Chat',
//                   onTap: () {},
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactIconButton({
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.2),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Icon(icon, color: Colors.white, size: 24),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showBookingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: AppColors.primary.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Icon(service.icon, color: AppColors.primary),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Text(
//                 context.isArabic ? 'ابدأ حجزك' : 'Start Your Booking',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               context.isArabic
//                   ? "هل أنت مستعد لحجز ${service.titleAr}؟"
//                   : 'Ready to book ${service.titleEn}?',
//               style: const TextStyle(fontSize: 15),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               context.isArabic
//                   ? "سيتواصل معكم فريقنا قريباً لإتمام حجزكم والإجابة على أي أسئلة قد تكون لديكم."
//                   : 'Our team will contact you shortly to complete your booking and answer any questions you may have.',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: AppColors.textSecondary,
//                 height: 1.5,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: AppColors.primary.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.support_agent, color: AppColors.primary),
//                   SizedBox(width: 12),
//                   Expanded(
//                     child: Text(
//                       context.isArabic
//                           ? "خدمة دعم العملاء متاحة على مدار الساعة طوال أيام الأسبوع."
//                           : '24/7 Customer Support Available',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         color: AppColors.primary,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text(context.isArabic ? "إلغاء" : 'Cancel'),
//           ),
//           ElevatedButton.icon(
//             onPressed: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Row(
//                     children: [
//                       const Icon(Icons.check_circle, color: Colors.white),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           context.isArabic
//                               ? "تم استلام طلب الحجز! سنتواصل معك قريباً."
//                               : 'Booking request received! We\'ll contact you soon.',
//                         ),
//                       ),
//                     ],
//                   ),
//                   backgroundColor: AppColors.success,
//                   behavior: SnackBarBehavior.floating,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               );
//             },
//             icon: const Icon(Icons.phone),
//             label: Text(context.isArabic ? 'طلب مكالمة' : 'Request Call'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showInfoDialog(BuildContext context, String title, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: Row(
//           children: [
//             const Icon(Icons.info_outline, color: AppColors.secondary),
//             const SizedBox(width: 12),
//             Expanded(child: Text(title, style: const TextStyle(fontSize: 18))),
//           ],
//         ),
//         content: Text(
//           message,
//           style: const TextStyle(
//             fontSize: 15,
//             height: 1.6,
//             color: AppColors.textSecondary,
//           ),
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text(context.isArabic ? 'أحصل عليها' : 'Got it'),
//           ),
//         ],
//       ),
//     );
//   }
// }
