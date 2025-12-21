import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/Controller/sitter/sitter_profile_controller.dart';
import 'package:petcare/view/pet_sitter/profile/portfolio_screen.dart';
import 'package:petcare/view/pet_sitter/profile/privacy_policy_screen.dart';
import 'package:petcare/view/pet_sitter/profile/promo_code.dart';
import 'package:petcare/view/pet_sitter/profile/services_screen.dart';
import 'package:petcare/view/pet_sitter/profile/terms_condition_screen.dart';
import '../../../utils/app_colors.dart';
import '../../pet_owner/profile/Payments.dart';
import '../../pet_owner/profile/privacy_policy_screen.dart';
import '../../pet_owner/profile/terms_condition_screen.dart';
import 'account_setting.dart';
import 'change_password_screen.dart';
import 'delate_account.dart';
import 'edit_profile_screen.dart';
import 'help_support_screen.dart';

final controller = Get.put(SitterProfileController());

class SitterProfileScreen extends StatelessWidget {
  const SitterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
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
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  /// ================= PROFILE CARD =================
                  Container(
                    height: 180.h, // Increased height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: AppColors.mainAppColor, // Fallback color
                    ),
                    child: Stack(
                      children: [
                        // Background SVG Image at Bottom Right
                        Positioned(
                          bottom:
                              -20, // Negative positioning to let it bleed out slightly if desired, or 0 for flush
                          right: -10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(14.r),
                            ),
                            // Using SvgPicture for .svg files
                            child: SvgPicture.asset(
                              'assets/icons/www.svg',
                              width:
                                  150.w, // Increased size for background effect
                              colorFilter: ColorFilter.mode(
                                Colors.white.withOpacity(0.1),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),

                        // Content
                        Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Profile Image
                                  Container(
                                    width: 58.w,
                                    height: 58.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/mursalin.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 12.w),

                                  /// Info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start, // Align Column children to start (left) by default
                                      children: [
                                        SizedBox(height: 20.h,),
                                        // Name
                                        Text(
                                          'NIROB HASAN',
                                          style: TextStyle(
                                            fontFamily: 'BaksoSapi',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white,
                                          ),
                                        ),

                                        // Location (Bottom Right)
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .end, // Align Row content to the right
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/location.svg',
                                              color: AppColors.redColor,
                                              width: 16.w,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              'cdmx',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                             SizedBox(height: 10.h,),
                              Text(
                                'PET SITTER',
                                style: TextStyle(
                                  fontFamily: 'BaksoSapi',
                                  fontSize: 14, // Made slightly header-like
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withOpacity(0.9),
                                ),
                              ),
                              SizedBox(height: 6.h),

                              /// Date
                              Text(
                                'Mon, Nov 02, 2025 at 10:00 PM',
                                style: GoogleFonts.montserrat(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 8.h),

                              /// Rating
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '4.9 (42 reviews)',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  /// ================= SITTER BUTTON =================
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.redColor, width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Sitter on Wuffoos',
                          style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Padding between top section and first card
            SizedBox(height: 16.h),

            // **Earnings Summary Section (Card Style)**
            _buildCardSection(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Title
                  Text(
                    'Earnings Summary',
                    style: TextStyle(
                      fontFamily: 'BaksoSapi',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainAppColor,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Total Income and Promo Code Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Income',
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textDark.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '\$900.50',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainAppColor,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => const PromoCodeScreen()),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.mainAppColor,
                                width: 1.5,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: Text(
                            'Apply Promo Code',
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainAppColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Monthly/Pending Earnings Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildEarningColumn('This Month', '\$842.00'),
                      _buildEarningColumn('Last Month', '\$753.50'),
                      _buildEarningColumn('Pending', '\$135.00'),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // **Account Information Section (Card Style)**
            _buildCardSection(
              title: 'Account Information',
              child: Column(
                children: [
                  _buildMenuItem(
                    svgIcon: "assets/icons/edit.svg",
                    title: 'Edit Profile',
                    onTap: () => Get.to(() => const EditProfileScreen()),
                  ),

                  _buildMenuItem(
                    svgIcon: "assets/icons/change.svg",
                    title: 'Change password',
                    onTap: () => Get.to(() => const ChangePasswordScreen()),
                  ),

                  _buildMenuItem(
                    svgIcon: "assets/icons/payment-method.svg",
                    title: 'Payments',
                    onTap: () => Get.to(() => const PaymentsScreen()),
                  ),

                  _buildMenuItem(
                    svgIcon: "assets/icons/serviceIcon.svg",
                    title: 'Services',
                    onTap: () => Get.to(() => const YourServicesScreen()),
                  ),

                  _buildMenuItem(
                    svgIcon: "assets/icons/portfolio.svg",
                    title: 'Portfolio',
                    onTap: () => Get.to(() => PortfolioScreen()),
                  ),

                  // Switch Profile Item
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SvgPicture.asset(
                        //   "assets/icons/switch.svg",
                        //   width: 22.w,
                        //   height: 22.h,
                        //   color: AppColors.mainAppColor,
                        // ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Text(
                            'Switch profile',
                            style: GoogleFonts.montserrat(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                        Obx(
                          () => Switch(
                            value: controller.switchProfile.value,
                            onChanged: controller.toggleSwitch,
                            activeColor: AppColors.mainAppColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // privacy and policy
            SizedBox(height: 8),
            _buildCardSection(
              title: 'Policy Center',
              child: Column(
                children: [
                  _buildMenuItem(
                    svgIcon: "assets/icons/shield-check.svg",
                    title: 'Privacy Policy',
                    onTap: () => Get.to(() =>  SiterPrivacyPolicyScreen()),
                  ),

                  _buildMenuItem(
                    svgIcon: "assets/icons/command-line (1).svg",
                    title: 'Terms & Condition',
                    onTap: () => Get.to(
                      () => SiterTermsConditionScreen(
                        appName: 'Pet-care',
                        companyName: 'Pet Care Ltd',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),

            // **Settings Section (Card Style)**
            _buildCardSection(
              title: 'Settings',
              child: Column(
                children: [
                  _buildMenuItem(
                    svgIcon: "assets/icons/account-setting-03.svg",
                    title: 'Account Settings',
                    onTap: () => Get.to(() => account()),
                  ),
                  _buildMenuItem(
                    svgIcon: "assets/icons/help-circle.svg",
                    title: 'Help & Support',
                    onTap: () => Get.to(() => const HelpSupportScreen()),
                  ),

                  _buildMenuItem(
                    svgIcon: "assets/icons/logout (1).svg",
                    title: 'Log Out',
                    onTap: () {},
                  ),

                  _buildMenuItem(
                    svgIcon: "assets/icons/elements.svg",
                    title: 'Delete Account',
                    titleColor: Colors.red,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const DeleteAccountDialog(),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

Widget _buildRoleButton(
  IconData icon,
  String title,
  bool isSelected,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.mainAppColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? AppColors.mainAppColor
              : AppColors.foundationColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20.sp,
            color: isSelected ? Colors.white : AppColors.mainAppColor,
          ),
          SizedBox(width: 8.w),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : AppColors.mainAppColor,
            ),
          ),
        ],
      ),
    ),
  );
}

// New widget for the card-based sections with shadow and rounded corners
Widget _buildCardSection({String? title, required Widget child}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.w),
    decoration: BoxDecoration(
      color: Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Color(0xFFE3E6F0),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    padding: EdgeInsets.all(20.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title,
            style: TextStyle(
              fontFamily: 'BaksoSapi',
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.mainAppColor,
            ),
          ),
          SizedBox(height: 16.h),
        ],
        child,
      ],
    ),
  );
}

// Helper for the column layout in Earnings Summary
Widget _buildEarningColumn(String label, String amount) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.subHeadingColor,
        ),
      ),
      SizedBox(height: 4.h),
      Text(
        amount,
        style: GoogleFonts.montserrat(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.mainAppColor,
        ),
      ),
    ],
  );
}

// Helper for all menu items
Widget _buildMenuItem({
  String? svgIcon,
  IconData? icon,
  required String title,
  required VoidCallback onTap,
  Color? titleColor,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          if (svgIcon != null)
            SvgPicture.asset(
              svgIcon,
              width: 22.w,
              height: 22.h,
              color: titleColor ?? Colors.black87,
            )
          else if (icon != null)
            Icon(icon, size: 22.sp, color: titleColor ?? Colors.black87),

          SizedBox(width: 12.w),

          // Text
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: titleColor ?? Color(0xFF585858),
              ),
            ),
          ),

          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16.sp,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    ),
  );
}

// Helper for menu item dividers
Widget _buildDivider() {
  return Divider(color: AppColors.foundationColor, height: 1);
}
