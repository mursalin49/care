// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_svg/flutter_svg.dart'; // <<< 1. Import flutter_svg
//
// import '../../helpers/route.dart';
// import '../../utils/app_colors.dart';
// import '../auth/Signup_screen.dart';
//
// class SitterOnboardingScreen extends StatelessWidget {
//   const SitterOnboardingScreen({super.key});
//
//   static const String dog1Asset = 'assets/images/dog1.png';
//   static const String dog2Asset = 'assets/images/dog2 (2).png';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.mainAppColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           'Become a Sitter',
//           style: GoogleFonts.montserrat(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(30.r),
//             bottomRight: Radius.circular(30.r),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // --- Section: Get paid to play with pets ---
//             Text(
//               'Get paid to play with pets',
//               style: GoogleFonts.montserrat(
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 10.h),
//             const Text(
//               'Wuffoos makes it easy and promotes you to the nation\'s largest network of pet owners, delivering dog-walking, connecting you love.',
//               style: TextStyle(
//                 fontSize: 14,
//                 height: 1.5,
//                 color: Colors.black54,
//               ),
//             ),
//             SizedBox(height: 20.h),
//             _buildPrimaryButton(
//               text: 'Get started',
//               onPressed: () {
//                 Get.toNamed(AppRoutes.signUpScreen);
//               },
//             ),
//
//             SizedBox(height: 30.h),
//
//             // --- Section: Flexibility puts you in control ---
//             Text(
//               'Flexibility puts you in control',
//               style: GoogleFonts.montserrat(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 10.h),
//
//             _buildCheckListItem('Set your own schedule and prices'),
//             _buildCheckListItem('Offer any combination of pet care home'),
//             _buildCheckListItem(
//               'Set the, age and other pet preferences that work for you.',
//             ),
//
//             SizedBox(height: 20.h),
//
//             // Image and text box sections... (omitted for brevity)
//             Center(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10.r),
//                 child: Image.asset(
//                   dog1Asset,
//                   height: 200.h,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       height: 200.h,
//                       color: Colors.grey.shade200,
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Image not found: dog1.png',
//                         style: GoogleFonts.montserrat(color: Colors.red),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Transform.translate(
//               offset: Offset(0, -30.h),
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 10.w),
//                 padding: EdgeInsets.all(12.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10.r),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Text(
//                   "It's easy. I go to the calendar and mark myself as available when I want to be.",
//                   style: GoogleFonts.montserrat(
//                     fontSize: 13.sp,
//                     color: Colors.black87,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.h),
//             Text(
//               'The tools to succeed',
//               style: GoogleFonts.montserrat(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 10.h),
//             _buildCheckListItem(
//               'The Wuffoos Guarantee which includes up to \$25,000 in vet cost reimbursement',
//             ),
//             _buildCheckListItem(
//               'Manage your pet sitting schedule and more with the Wuffoos app',
//             ),
//             _buildCheckListItem('24/7 support, including vet assistance'),
//             SizedBox(height: 30.h),
//             Text(
//               'How it works',
//               style: GoogleFonts.montserrat(
//                 fontSize: 24.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 20.h),
//             _buildHowItWorksItem(
//               title: 'Create your profile',
//               description:
//                   'Tell us a little about yourself and what pet home you want to offer.',
//             ),
//             _buildHowItWorksItem(
//               title: 'Accept requests',
//               description:
//                   'Tell us the types of pets you want to care for and the dates that work for you. You make your own schedule.',
//             ),
//             _buildHowItWorksItem(
//               title: 'Get paid',
//               description:
//                   'Payments are sent directly to your bank once you have completed a service.',
//             ),
//             SizedBox(height: 10.h),
//             _buildPrimaryButton(
//               text: 'Get started',
//               onPressed: () {
//                 Get.toNamed(AppRoutes.signUpScreen);
//               },
//             ),
//             SizedBox(height: 20.h),
//             Center(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10.r),
//                 child: Image.asset(
//                   dog2Asset,
//                   height: 200.h,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       height: 200.h,
//                       color: Colors.grey.shade200,
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Image of Sitting Dog here',
//                         style: GoogleFonts.montserrat(color: Colors.grey),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Transform.translate(
//               offset: Offset(0, -30.h),
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 10.w),
//                 padding: EdgeInsets.all(12.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10.r),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Text(
//                   "Thanks to the Wuffoos App, I know about my clients schedule immediately and I'm quick to respond!",
//                   style: GoogleFonts.montserrat(
//                     fontSize: 13.sp,
//                     color: Colors.black87,
//                     fontStyle: FontStyle.italic,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.h),
//
//             // --- Section: Services ---
//             Text(
//               'Services',
//               style: GoogleFonts.montserrat(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 15.h),
//
//             _buildServiceCard(
//               svgIconPath: 'assets/icons/bording.svg',
//               title: 'Boarding',
//               subtitle:
//                   'Care for a dog or cat overnight in your home. Sitters who offer boarding can make up to 3x more than sitters don\'t.',
//               highlight: 'HIGHEST EARNING',
//             ),
//
//             // Example 2: Using the standard IconData (if svgIconPath is null)
//             _buildServiceCard(
//               svgIconPath: 'assets/icons/doggy.svg',
//               title: 'Doggy Day Care',
//               subtitle:
//                   'Watch dogs during the day. Drop off and pick up in their own homes.',
//             ),
//
//             // Example 3: Using the NEW svgIconPath
//             _buildServiceCard(
//               svgIconPath: 'assets/icons/d_foot.svg',
//               title: 'Dog Walking',
//               subtitle: 'Take dogs out for a walk in your schedule.',
//             ),
//
//             SizedBox(height: 30.h),
//
//             // --- Safety section... (omitted for brevity) ---
//             Text(
//               'Safety first. Always.',
//               style: GoogleFonts.montserrat(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 10.h),
//             const Text(
//               'We work tirelessly to ensure tails keep wagging and purrs keep coming.',
//               style: TextStyle(
//                 fontSize: 14,
//                 height: 1.5,
//                 color: Colors.black54,
//               ),
//             ),
//             SizedBox(height: 15.h),
//             _buildSafetyCheckListItem(
//               'Every service you offer on Wuffoos is backed by The Wuffoos Guarantee',
//             ),
//             _buildSafetyCheckListItem(
//               'Safe, secured, and convenient online payments',
//             ),
//             _buildSafetyCheckListItem('A top tier support team available 24/7'),
//             _buildSafetyCheckListItem(
//               'Ongoing pet parent and sitter education',
//             ),
//             SizedBox(height: 30.h),
//             Text(
//               'Connect with pet owners ones your profile is approve',
//               style: GoogleFonts.montserrat(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: 10.h),
//             _buildPrimaryButton(
//               text: 'Start creating your profile',
//               onPressed: () {
//                 Get.toNamed(AppRoutes.signUpScreen);
//               },
//             ),
//             SizedBox(height: 40.h),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // --- Utility Widgets ---
//
//   Widget _buildPrimaryButton({
//     required String text,
//     required VoidCallback onPressed,
//   }) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: AppColors.mainAppColor,
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       child: TextButton(
//         onPressed: onPressed,
//         child: Text(
//           text,
//           style: GoogleFonts.montserrat(
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
//
//   // ... (Other utility widgets like _buildCheckListItem, _buildSafetyCheckListItem, _buildHowItWorksItem are unchanged)
//   Widget _buildCheckListItem(String text) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 8.h),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(Icons.check, color: AppColors.mainAppColor, size: 20.r),
//           SizedBox(width: 8.w),
//           Expanded(
//             child: Text(
//               text,
//               style: GoogleFonts.montserrat(
//                 fontSize: 14.sp,
//                 height: 1.5,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSafetyCheckListItem(String text) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 8.h),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(
//             Icons.check_circle_outline,
//             color: AppColors.mainAppColor,
//             size: 20.r,
//           ),
//           SizedBox(width: 8.w),
//           Expanded(
//             child: Text(
//               text,
//               style: GoogleFonts.montserrat(
//                 fontSize: 14.sp,
//                 height: 1.5,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHowItWorksItem({
//     required String title,
//     required String description,
//   }) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 25.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.montserrat(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w600,
//               color: AppColors.textDark,
//             ),
//           ),
//           SizedBox(height: 5.h),
//           Text(
//             description,
//             style: GoogleFonts.montserrat(
//               fontSize: 14.sp,
//               height: 1.4,
//               color: Colors.black54,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // <<< 2. Modified _buildServiceCard to accept IconData or String? svgIconPath
//   Widget _buildServiceCard({
//     IconData? icon,
//     String? svgIconPath,
//     required String title,
//     required String subtitle,
//     String? highlight,
//   }) {
//     // Determine which icon to display
//     Widget iconWidget;
//     if (svgIconPath != null) {
//       // If SVG path is provided, use SvgPicture.asset
//       iconWidget = SvgPicture.asset(
//         svgIconPath,
//         height: 28.r,
//         width: 28.r,
//         // Use colorFilter to apply the primary color to the SVG
//         colorFilter: ColorFilter.mode(AppColors.mainAppColor, BlendMode.srcIn),
//       );
//     } else if (icon != null) {
//       // If IconData is provided, use standard Icon
//       iconWidget = Icon(icon, size: 28.r, color: AppColors.mainAppColor);
//     } else {
//       // Fallback: If neither is provided, use a placeholder
//       iconWidget = SizedBox(width: 28.r);
//     }
//
//     return Container(
//       margin: EdgeInsets.only(bottom: 15.h),
//       padding: EdgeInsets.all(15.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 5,
//           ),
//         ],
//         border: Border.all(color: Colors.grey.shade200, width: 1.r),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           iconWidget,
//           SizedBox(width: 15.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       title,
//                       style: GoogleFonts.montserrat(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     if (highlight != null)
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 8.w,
//                           vertical: 4.h,
//                         ),
//                         decoration: BoxDecoration(
//                           color: AppColors.yello,
//                           borderRadius: BorderRadius.circular(5.r),
//                         ),
//                         child: Text(
//                           highlight,
//                           style: GoogleFonts.montserrat(
//                             fontSize: 10.sp,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//                 SizedBox(height: 4.h),
//                 Text(
//                   subtitle,
//                   style: GoogleFonts.montserrat(
//                     fontSize: 13.sp,
//                     height: 1.4,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// Import a display font to mimic the Figma's handwritten style
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/route.dart';
import '../../utils/app_colors.dart';


// Assuming AppColors.dart contains:
// static const Color mainAppColor = Color(0xFF235A62); // Dark Teal
// static const Color primaryActionColor = Color(0xFFE56A5B); // Reddish-Orange

class SitterOnboardingScreen extends StatelessWidget {
  const SitterOnboardingScreen({super.key});

  // --- Constants for Assets ---
  static const String dog1Asset = 'assets/images/portfolioImg.png'; // Image for Flexibility section
  static const String dog2Asset = 'assets/images/portfolioImg.png'; // Image for Tools to Succeed section

  // Service Icons
  static const String boardingIcon = 'assets/icons/bording.svg';
  static const String doggyDayCareIcon = 'assets/icons/doggy (1).svg';
  static const String dogWalkIcon = 'assets/icons/d_foot.svg';

  // How It Works Icons
  static const String profileIcon = 'assets/icons/star.svg';
  static const String requestsIcon = 'assets/icons/star.svg';
  static const String paidIcon = 'assets/icons/star.svg';
  static const String flexibilityIcon = 'assets/icons/star.svg'; // New icon for Flexibility title

  // Safety Icon
  static const String safetyHeartIcon = 'assets/icons/star.svg';

  // Background 'W' Logo (faded)
  static const String bgWLogo = 'assets/icons/star.svg'; // Needs to be a large, faded asset

  // Helper function for the unique header font style
  TextStyle _getDisplayHeaderStyle({required Color color, double fontSize = 24.0}) {
    // Using a fun, display font to match the Figma headers (e.g., Bangers)
    // You should replace this with the exact font used in your Figma if possible.
    return GoogleFonts.bangers(
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w400,
      color: color,
      letterSpacing: 1.5,
    );
  }

  // Helper function for the unique body text style in floating boxes
  TextStyle _getFloatingTextStyle({required Color color, double fontSize = 13.0}) {
    return GoogleFonts.montserrat(
      fontSize: fontSize.sp,
      color: color,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // AppBar color changes in some Figma screens, but we'll use Dark Teal here
        backgroundColor: AppColors.mainAppColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'BECOME A SITTER',
          // Applying the unique display font to the AppBar title
          style: TextStyle(
            fontFamily: 'BaksoSapi',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // --- 1. Section: GET PAID TO PLAY WITH PETS! (Dark Teal Container with BG Logo) ---
            _buildCustomContainer(
              color: AppColors.mainAppColor,
              hasBackgroundLogo: true, // Enable the faded 'W' logo
              child: Column(
                children: [
                  Text(
                    'GET PAID TO PLAY WITH PETS!',
                    textAlign: TextAlign.center,
                    // Use a standard style here as the Figma screen doesn't use the display font
                    style: TextStyle(
                      fontFamily: 'BaksoSapi',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    'Wuffoos makes it easy and promotes you to the nation\'s largest network of pet owners, delivering dog-walking, connection you love.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  _buildPrimaryButton(
                    text: 'GET STARTED',

                    onPressed: () => Get.toNamed(AppRoutes.sitterSignUpScreen),
                    buttonColor: AppColors.primaryActionColor,
                  ),
                ],
              ),
            ),

            // --- 2. Section: FLEXIBILITY PUTS YOU IN CONTROL (White Container with Icon) ---
            _buildCustomContainer(
              color: Colors.white,
              hasShadow: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row( // Added Row to include the icon
                    children: [
                      // Person icon from Figma
                      SvgPicture.asset(
                        flexibilityIcon,
                        height: 20.r,
                        width: 20.r,
                        colorFilter: ColorFilter.mode(AppColors.primaryActionColor, BlendMode.srcIn),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'FLEXIBILITY PUTS YOU IN CONTROL',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  _buildCheckListItem('Set your own schedule and prices', iconColor: AppColors.primaryActionColor),
                  _buildCheckListItem('Offer any combination of pet care home', iconColor: AppColors.primaryActionColor),
                  _buildCheckListItem('Set the age and other pet preferences that work for you.', iconColor: AppColors.primaryActionColor),
                ],
              ),
            ),

            // --- 3. Image and Floating Text Box (Red Box) ---
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  dog1Asset,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(height: 200.h, color: Colors.grey.shade200);
                  },
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -30.h),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryActionColor, // Reddish-orange background
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  "IT'S EASY. I GO TO THE CALENDAR AND MARK MYSELF AVAILABLE WHEN I WANT TO BE.",
                  textAlign: TextAlign.center,
                  style: _getFloatingTextStyle(color: Colors.white), // Using the bold, uppercase style
                ),
              ),
            ),

            SizedBox(height: 10.h),

            // --- 4. Section: THE TOOLS TO SUCCEED (Dark Teal Container - based on image_4220da.png) ---
            // NOTE: The structure changes here based on image_429880.png and image_4220da.png
            _buildCustomContainer(
              color: AppColors.mainAppColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'THE TOOLS TO SUCCEED',
                    style: _getDisplayHeaderStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 10.h),
                  // Check list items with white icon/text
                  _buildCheckListItem(
                    'The Wuffoos Guarantee which includes up to \$25,000 in vet cost',
                    iconColor: AppColors.primaryActionColor,
                    textColor: Colors.white,
                  ),
                  _buildCheckListItem(
                    'Manage your schedule and more with the Wuffoos App',
                    iconColor: AppColors.primaryActionColor,
                    textColor: Colors.white,
                  ),
                  _buildCheckListItem('24/7 support including vet assistance', iconColor: AppColors.primaryActionColor, textColor: Colors.white),
                  SizedBox(height: 30.h),

                  // Dog Image (Image_429880.png)
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        dog2Asset,
                        height: 150.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(height: 150.h, color: Colors.grey.shade600);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // --- 5. Section: HOW IT WORKS (Continuing Dark Teal Container) ---
                  Text(
                    'HOW IT WORKS',
                    style: _getDisplayHeaderStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: 20.h),
                  _buildHowItWorksItem(
                    svgIconPath: profileIcon,
                    title: 'CREATE YOUR PROFILE',
                    description: 'Tell us a little about yourself and what pet care you want to offer.',
                  ),
                  _buildHowItWorksItem(
                    svgIconPath: requestsIcon,
                    title: 'ACCEPT REQUESTS',
                    description: 'Tell us the types of pets you want to care for and the dates that work for you.',
                  ),
                  _buildHowItWorksItem(
                    svgIconPath: paidIcon,
                    title: 'GET PAID',
                    description: 'Payments are sent directly to your bank once you have completed a service.',
                  ),
                ],
              ),
            ),

            // --- 6. Section: SERVICES (White background, Search Bar and 3-Icon Grid) ---
            SizedBox(height: 15.h),

            // Search Bar
            Container(
              margin: EdgeInsets.only(bottom: 25.h),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      'Search Services',
                      style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ),

            // See All link
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Service',
                style: TextStyle(
                  fontFamily: 'BaksoSapi',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.mainAppColor,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'See All',
                style: GoogleFonts.montserrat(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainAppColor,
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // 3-Icon Service Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildServiceIconItem(
                  svgIconPath: boardingIcon,
                  title: 'Boarding',
                  isHighlighted: true,
                ),
                _buildServiceIconItem(
                  svgIconPath: doggyDayCareIcon,
                  title: 'Doggy Day Care',
                ),
                _buildServiceIconItem(
                  svgIconPath: dogWalkIcon,
                  title: 'Dog Walking',
                ),
              ],
            ),
            SizedBox(height: 30.h),

            // --- 7. Section: SAFETY FIRST, ALWAYS (Dark Teal Container with BG Logo) ---
            _buildCustomContainer(
              color: AppColors.mainAppColor,
              hasBackgroundLogo: true, // Enable the faded 'W' logo
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'SAFETY FIRST, ALWAYS',
                    textAlign: TextAlign.center,
                    style: _getDisplayHeaderStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(height: 10.h),
                  // Hand/Heart Icon
                  SvgPicture.asset(
                    safetyHeartIcon,
                    height: 40.r,
                    width: 40.r,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  SizedBox(height: 15.h),
                  const Text(
                    'We work tirelessly to ensure tails keep wagging and purrs keep coming.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  // Safety Check list items (White icons/text)
                  _buildCheckListItem('Every service you offer on Wuffoos is backed by The Wuffoos Guarantee', iconColor: AppColors.primaryActionColor, textColor: Colors.white),
                  _buildCheckListItem('Safe, secured, and convenient online payments', iconColor: AppColors.primaryActionColor, textColor: Colors.white),
                  _buildCheckListItem('A top tier support team available 24/7', iconColor: AppColors.primaryActionColor, textColor: Colors.white),
                  _buildCheckListItem('Ongoing pet parent and sitter education', iconColor: AppColors.primaryActionColor, textColor: Colors.white),
                  SizedBox(height: 20.h),

                  // VIEW DETAILS Button (Reddish-orange)
                  _buildPrimaryButton(
                    text: 'VIEW DETAILS',
                    onPressed: () {},
                    buttonColor: AppColors.primaryActionColor,
                  ),
                ],
              ),
            ),

            // --- 8. Connect and Profile Button ---
            SizedBox(height: 30.h),
            Text(
              'Connect with pet owners once your profile is approved',
              style: GoogleFonts.montserrat(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10.h),
            _buildSecondaryButton(
              text: 'Start creating your profile',
              onPressed: () {
                Get.toNamed(AppRoutes.signUpScreen);
              },
              buttonColor: AppColors.primaryActionColor,
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  // --- Utility Widgets ---

  // Custom Container for sections (NOW WITH OPTIONAL BACKGROUND LOGO)
  Widget _buildCustomContainer({
    required Widget child,
    required Color color,
    bool hasShadow = false,
    bool hasBackgroundLogo = false,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: hasShadow
            ? [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ]
            : null,
      ),
      child: Stack(
        children: [
          // Faded Background Logo
          if (hasBackgroundLogo)
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                bgWLogo, // Your faded W logo asset
                height: 150.r,
                width: 150.r,
                // The Figma shows a faded color, this depends on your actual SVG color/opacity
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.srcIn),
              ),
            ),

          // Main Content
          Padding(
            padding: EdgeInsets.all(16.w),
            child: child,
          ),
        ],
      ),
    );
  }

  // Primary Button (No change needed)
  Widget _buildPrimaryButton({
    required String text,
    required VoidCallback onPressed,
    required Color buttonColor,
  }) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'BaksoSapi',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
  Widget _buildSecondaryButton({
    required String text,
    required VoidCallback onPressed,
    required Color buttonColor,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'BaksoSapi',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
  // Check List Item (Updated to use Reddish-Orange icon and accept custom text color)
  Widget _buildCheckListItem(
      String text, {
        required Color iconColor,
        Color textColor = Colors.black87,
      }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon color is primaryActionColor (reddish-orange) in the dark teal containers
          Icon(Icons.check, color: iconColor, size: 20.r),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                height: 1.5,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // How It Works Item (No change needed)
  Widget _buildHowItWorksItem({
    required String svgIconPath,
    required String title,
    required String description,
  }) {
    // The background is Dark Teal here, so the text needs to be white/light
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Container (Reddish-orange background, White Icon)
          Container(
            height: 40.r,
            width: 40.r,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.primaryActionColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              svgIconPath,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  // Using the Display Header Style for How It Works Titles
                  style: GoogleFonts.montserrat(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text must be white in Dark Teal container
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  description,
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    height: 1.4,
                    color: Colors.white70, // Slightly faded white for description
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Service Icon Item (No change needed)
  Widget _buildServiceIconItem({
    required String svgIconPath,
    required String title,
    bool isHighlighted = false,
  }) {
    return Column(
      children: [
        // Icon Box
        Container(
          height: 65.r,
          width: 65.r,
          decoration: BoxDecoration(
            color: isHighlighted ? AppColors.primaryActionColor : Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: Colors.grey.shade300, width: 1.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              svgIconPath,
              height: 35.r,
              width: 35.r,
              colorFilter: ColorFilter.mode(
                  isHighlighted ? Colors.white : AppColors.primaryActionColor,
                  BlendMode.srcIn),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        // Label Box
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.primaryActionColor, // Reddish-orange label background
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}