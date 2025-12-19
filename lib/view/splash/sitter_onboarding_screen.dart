import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/route.dart';
import '../../utils/app_colors.dart';




class SitterOnboardingScreen extends StatelessWidget {
  const SitterOnboardingScreen({super.key});


  static const String dog1Asset = 'assets/images/dog_happy_beagle.png';
  static const String dog2Asset = 'assets/images/dog_working_bordercollie.png';
  static const String profileIcon = 'assets/images/head.png';
  static const String requestsIcon = 'assets/images/ww.png';
  static const String paidIcon = 'assets/images/paid.png'; // <--- UPDATED TO PNG


  // Service Icons
  static const String board = 'assets/images/boar.png';
  static const String dogg = 'assets/images/dogy.png';
  static const String dogy = 'assets/images/dog.png';


  // Safety Icon
  static const String safetyHeartIcon = 'assets/icons/safety_heart.svg';

  // Background 'W' Logo (faded)
  static const String bgWLogo = 'assets/icons/w.svg';

  // Helper function for the unique display font style (BaksoSapi/similar)
  TextStyle _getDisplayHeaderStyle({required Color color, double fontSize = 24.0}) {

    return TextStyle(
      fontFamily: 'BaksoSapi',
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w700,
      color: color,
      letterSpacing: 1.0,
    );
  }

  // Helper function for the unique body text style in floating boxes
  TextStyle _getFloatingTextStyle({required Color color, double fontSize = 13.0}) {
    return GoogleFonts.montserrat(
      fontSize: fontSize.sp,
      color: color,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {

    const String dog1Asset = 'assets/images/dog11.png';
    const String dog2Asset = 'assets/images/dog22.png';


    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'BECOME A SITTER',
          style:GoogleFonts.montserrat(color: AppColors.white, fontSize: 20, fontWeight:  FontWeight.w600),
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
              hasBackgroundLogo: true,
              child: Column(
                children: [
                  Text(
                    'GET PAID TO PLAY WITH PETS!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                   Text(
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

            // --- 2. Section: FLEXIBILITY PUTS YOU IN CONTROL (White Container with Icon/Checks) ---
            _buildCustomContainer(
              color: Colors.white,
              hasShadow: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading Row
                  Row(
                    children: [
                      // Icon for Flexibility section (PNG - head.png)
                      Image.asset(
                        profileIcon, // 'assets/images/head.png'
                        width: 25,
                        height: 28,
                        fit: BoxFit.contain,
                        color: AppColors.mainAppColor,
                      ),

                      SizedBox(width: 8.w),
                      Text(
                        // **Exact text from the image for the main heading**
                        'Flexibility puts you in control',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.sp, // Slightly larger font for the main heading
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h), // Add space after the main heading

                  _buildCheckListItem('Set your own schedule and prices', iconColor: AppColors.redColor),
                  SizedBox(height: 10.h), // Add a little space between items for better reading

                  _buildCheckListItem('Offer any combination of pet care services', iconColor: AppColors.redColor),
                  SizedBox(height: 10.h),

                  _buildCheckListItem('Set the, age, and other pet preferences that work for you', iconColor: AppColors.redColor),
                ],
              ),
            ),

            // --- 3. Image and Floating Text Box (Red Box - Beagle) ---
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
                  color: AppColors.primaryActionColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  "It’s easy. I go to the calendar and mark myself as available when I want to be.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: .5.h),

            // --- 4. Section: THE TOOLS TO SUCCEED (White Container) ---
            _buildCustomContainer(
              color: AppColors.bgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'THE TOOLS TO SUCCEED',
                    style: GoogleFonts.montserrat(color: AppColors.mainAppColor, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10.h),
                  // Check list items with black text
                  _buildCheckListItem(
                    'The Wuffoos Guarantee which includes up to \$25,000 in vet cost reimbursement',
                    iconColor: AppColors.primaryActionColor,
                    textColor: Colors.black87,
                  ),
                  _buildCheckListItem(
                    'Manage your pet sitting schedule and more with the Wuffoos App',
                    iconColor: AppColors.primaryActionColor,
                    textColor: Colors.black87,
                  ),
                  _buildCheckListItem('24/7 support, including vet assistance', iconColor: AppColors.primaryActionColor, textColor: Colors.black87),
                ],
              ),
            ),

            // --- 5. Image and Floating Text Box (Red Box - Border Collie) ---
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  dog2Asset,
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
                  color: AppColors.primaryActionColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  "Thanks to the Wuffoos app, I know about my clients’ schedule immediately and I’m quick to respond!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 10.h),

            // --- 6. Section: HOW IT WORKS (White Background - Simplified) ---
            _buildHowItWorksSection(),

            // --- 7. Section: SERVICES (White Background - List Style) ---
            SizedBox(height: 20.h),
            Text(
              'Services',
              style: GoogleFonts.montserrat(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.mainAppColor,
              ),
            ),
            SizedBox(height: 10.h),

            _buildServiceListItem(
              iconPath: board,
              title: 'Boarding',
              description: 'Care for a dog or cat overnight in your home. Sitters who offer boarding can make up to 2x more than sitters who don\'t.',
              highlightText: 'HIGHEST EARNING',
            ),
            _buildServiceListItem(
              iconPath: dogg,
              title: 'Doggy Day Care',
              description: 'Watch dogs during the day. Drop off and pick up in their own homes.',
            ),
            _buildServiceListItem(
              iconPath: dogy,
              title: 'Dog Walking',
              description: 'Take dogs out for a walk in your schedule.',
            ),

            SizedBox(height: 30.h),

            // --- 8. Section: SAFETY FIRST, ALWAYS (Dark Teal Container with BG Logo) ---
            _buildCustomContainer(
              color: AppColors.bgColor,
              hasBackgroundLogo: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Left aligned content
                children: [
                  Text(
                    'Safety first. Always.',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(color: AppColors.mainAppColor, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    'We work tirelessly to ensure tails keep wagging and purrs keep coming.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: AppColors.greytext,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  // Safety Check list items
                  _buildCheckListItem('Every service you offer on Wuffoos is backed by The Wuffoos Guarantee', iconColor: AppColors.primaryActionColor, textColor: AppColors.mainAppColor),
                  _buildCheckListItem('Safe, secured, and convenient online payments', iconColor: AppColors.primaryActionColor, textColor: AppColors.mainAppColor),
                  _buildCheckListItem('A top tier support team available 24/7', iconColor: AppColors.primaryActionColor, textColor: AppColors.mainAppColor),
                  _buildCheckListItem('Ongoing pet parent and sitter education', iconColor: AppColors.primaryActionColor, textColor: AppColors.mainAppColor),
                  // NOTE: "VIEW DETAILS" button removed as per Figma screenshot
                ],
              ),
            ),

            // --- 9. Connect and Profile Button (Bottom Section) ---
            SizedBox(height: 10.h),
            Text(
              textAlign: TextAlign.center,
              'Connect with pet owners ones your profile is approve',
              style: GoogleFonts.montserrat(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.mainAppColor,
              ),
            ),
            SizedBox(height: 20.h),
            _buildSecondaryButton(
              text: 'Start creating your profile',
              onPressed: () {
                Get.toNamed(AppRoutes.sitterSignUpScreen);
              },
              buttonColor: AppColors.mainAppColor, // Dark Teal Button
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  // --- Utility Widgets ---

  // Custom Container for sections (Dark Teal or White w/ Shadow)
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
                bgWLogo,
                height: 150.r,
                width: 150.r,

                colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.2), BlendMode.srcIn),
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

  // Primary Button (Reddish Orange)
  Widget _buildPrimaryButton({
    required String text,
    required VoidCallback onPressed,
    required Color buttonColor,
  }) {
    return SizedBox( // Changed to SizedBox for specific width control
      width: 150.w, // Adjusted width for better look
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(color: AppColors.white, fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }


  // Secondary Button (Full width, Dark Teal)
  Widget _buildSecondaryButton({
    required String text,
    required VoidCallback onPressed,
    required Color buttonColor,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(color: AppColors.white, fontSize: 18,fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  // Check List Item (Correct PNG icon used)
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
          Image.asset(
            // Checkmark icon used here (assumed assets/images/correct.png exists)
            'assets/images/correct.png',
            width: 20,
            height: 20,
            fit: BoxFit.contain,
            color: AppColors.redColor,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: AppColors.mainAppColor,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildHowItWorksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How it works',
          style: GoogleFonts.montserrat(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.mainAppColor,
          ),
        ),
        SizedBox(height: 15.h),
        // তিনটিই এখন PNG
        _buildHowItWorksListItem(
          iconPath: profileIcon, // PNG (head.png)
          title: 'Create your profile',
          description: 'Tell us a little about yourself and what pet services you want to offer.',
        ),
        _buildHowItWorksListItem(
          iconPath: requestsIcon, // PNG (ww.png)
          title: 'Accept requests',
          description: 'Tell us the types of pets you want to care for and the dates that work for you. You make your own schedule.',
        ),
        _buildHowItWorksListItem(
          iconPath: paidIcon, // PNG (paid.png)
          title: 'Get paid',
          description: 'Payments are sent directly to your bank once you have completed a service.',
        ),
        SizedBox(height: 15.h),
        Center(
          child:_buildSecondaryButton(
            text: 'GET STARTED',
            onPressed: () => Get.toNamed(AppRoutes.sitterSignUpScreen),
            buttonColor: AppColors.mainAppColor,
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }


  Widget _buildHowItWorksListItem({
    required String iconPath,
    required String title,
    required String description,
  }) {

    Color iconColor;
    if (iconPath.contains('head.png')) {
      iconColor = AppColors.primaryActionColor;
    } else if (iconPath.contains('ww.png')) {
      iconColor = AppColors.mainAppColor; // Dark Teal
    } else if (iconPath.contains('paid.png')) { // paid.png check
      iconColor = AppColors.redColor; // Red
    } else {
      iconColor = AppColors.mainAppColor; // Default color
    }



    Widget iconWidget = Image.asset(
      iconPath,
      height: 24.r,
      width: 24.r,
      fit: BoxFit.contain,

      color: iconColor,
    );


    // 3.
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconWidget,
              SizedBox(width: 10.w),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainAppColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.only(left: 40.w), // Align description under text
            child: Text(
              description,
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                height: 1.4,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Service List Item (Full width card style)
  Widget _buildServiceListItem({
    required String iconPath,
    required String title,
    required String description,
    String? highlightText,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Box (uses SvgPicture)
          Container(


            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child:  Image.asset(
              iconPath,
              height: 24.r,
              width: 24.r,
              fit: BoxFit.contain,


            )
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainAppColor,
                      ),
                    ),
                    if (highlightText != null) ...[
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: AppColors.primaryActionColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          highlightText,
                          style: GoogleFonts.montserrat(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  description,
                  style: GoogleFonts.montserrat(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}