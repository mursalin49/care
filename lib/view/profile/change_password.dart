import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:petcare/view/components/custom_app_bar.dart';

import '../components/custom_text_field.dart';


class ChangePasswordScreen extends StatelessWidget{
   ChangePasswordScreen({super.key});

  final TextEditingController currentPassCtrl = TextEditingController();
  final TextEditingController newPassCtrl = TextEditingController();
  final TextEditingController confirmPassCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        title: "Change Password",
        showBackButton: true,
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.055),
              Text(
                "Current Password",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B4237),
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: currentPassCtrl,
                hintText: 'Enter your current password',
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xFF5E5E5E),
                ),
                fillColor: Color(0xFF1C5941).withOpacity(0.03),
                fieldBorderColor: AppColors.mainAppColor,
              ),
              SizedBox(height: 16.h),


              Text(
                "New Password",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B4237),
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: newPassCtrl,
                hintText: 'Enter your new password',
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xFF5E5E5E),
                ),
                fillColor: Color(0xFF1C5941).withOpacity(0.03),
                fieldBorderColor: AppColors.mainAppColor,
              ),
              SizedBox(height: 16.h),


              Text(
                "Confirm Password",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B4237),
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: confirmPassCtrl,
                hintText: 'Re-enter your new password',
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xFF5E5E5E),
                ),
                fillColor: Color(0xFF1C5941).withOpacity(0.03),
                fieldBorderColor: AppColors.mainAppColor,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.044),

              GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  decoration: BoxDecoration(
                    color: AppColors.mainAppColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "Save Changes",
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE6E6E6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.14),

            ],
          ),
        ),
      ),
    );
  }

}