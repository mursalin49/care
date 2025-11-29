import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:get/get.dart';
import '../../components/custom_app_bar.dart';
import 'language_notification_screen.dart';


class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: "Account Settings"),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          settingsTile(
            title: "Language",
            onTap: () {
              Get.to(() => LanguageAndNotificationScreen());
            },
          ),
          SizedBox(height: 12.h),
          settingsTile(
            title: "Notifications",
            onTap: () {
              Get.to(() => LanguageAndNotificationScreen());
            },
          ),
        ],
      ),
    );
  }

  Widget settingsTile({
    required String title,
    required VoidCallback onTap,
    IconData icon = Icons.arrow_forward_ios, // optional
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFFE5E5E5)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(0.080),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1F1D1D),
                ),
              ),
              Icon(icon, size: 18, color: const Color(0xFF4D4D4D)),
            ],
          ),
        ),
      ),
    );
  }
}
