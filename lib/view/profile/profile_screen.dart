import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/view/components/custom_app_bar.dart';
import '../../Controller/profile/pet_controller.dart';
import '../../utils/app_colors.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'add_pet_screen.dart';

class ProfileScreen extends StatelessWidget{
  ProfileScreen({super.key});

  final _controller = ValueNotifier<bool>(false);

  final PetController c = Get.put(PetController());

  void _navigateToAddPet() async {
    await Get.to(() => AddPetScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Profile",
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.040),
              Center(
                child: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.mainAppColor, width: 1.5),
                  ),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/images/profileImg.png"),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Seam Rahman",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "Mexico City",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF000000),
                ),
              ),
              SizedBox(height: 20.h),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "My Pets",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF111111),
                  ),
                ),
              ),
              SizedBox(height: 18.h),

              /// My Pets Section with Horizontal Scroll
              SizedBox(
                height: 120.h,
                child: Obx(() {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...c.pets.map((pet) {
                        return Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.mainAppColor, width: 1),
                                ),
                                child: CircleAvatar(
                                  radius: 32,
                                  backgroundImage: (pet.imagePath != null && pet.imagePath!.isNotEmpty)
                                      ? FileImage(File(pet.imagePath!))
                                      : AssetImage("assets/images/pet_placeholder.png")
                                  as ImageProvider,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                pet.name ?? "",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),

                      // ADD PET button
                      GestureDetector(
                        onTap: _navigateToAddPet,
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Column(
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.mainAppColor,
                                    width: 1.5,
                                  ),
                                ),
                                child: Icon(Icons.add, color: AppColors.mainAppColor, size: 28),
                              ),
                              SizedBox(height: 6.h),
                              Text("Add Pet", style: GoogleFonts.inter(fontSize: 12.sp))
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),



              SizedBox(height: 24.h),
              /// Sitter Button
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.mainAppColor, width: 1)
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/dogWalkIcon.svg", color: AppColors.mainAppColor,),
                      SizedBox(width: 5.w),
                      Text(
                        "Become a Pet Sitter",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.030),

              /// Account Information Details
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Color(0xFFE3E6F0),
                    width: 0.6,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      offset: const Offset(0, 2),
                      blurRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account Information",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F1D1D),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    settingsTile(
                      iconPath: "assets/icons/editProfile.svg",
                      title: "Edit Profile",
                      onTap: () {},
                    ),
                    SizedBox(height: 16.h),
                    settingsTile(
                      iconPath: "assets/icons/bookingHistory.svg",
                      title: "Booking history",
                      onTap: () {},
                    ),
                    SizedBox(height: 16.h),
                    settingsTile(
                      iconPath: "assets/icons/paymentIcon.svg",
                      title: "Payments",
                      onTap: () {},
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/icons/switchProfile.png", width: 24, height: 24, color: Color(0xFF585858),),
                            SizedBox(width: 8.w),
                            Text(
                              "Switch profile",
                              style: TextStyle(
                                fontFamily: 'Montserrat-Regular',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF4D4D4D),
                              ),
                            ),
                          ],
                        ),
                        AdvancedSwitch(
                          activeColor: AppColors.mainAppColor,
                          inactiveColor: Color(0xFF787880).withOpacity(0.16),
                          width: 48.w,
                          height: 25.h,
                          controller: _controller,
                          borderRadius: BorderRadius.circular(77),
                        ),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              /// Policy Center Details
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Color(0xFFE3E6F0),
                    width: 0.6,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      offset: const Offset(0, 2),
                      blurRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Policy Center",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F1D1D),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    settingsTile(
                      iconPath: "assets/icons/privacyIcon.svg",
                      title: "Privacy Policy",
                      onTap: () {},
                    ),
                    SizedBox(height: 16.h),
                    settingsTile(
                      iconPath: "assets/icons/termsIcon.svg",
                      title: "Terms & Conditions",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              /// Referrals and Promos Details
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Color(0xFFE3E6F0),
                    width: 0.6,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      offset: const Offset(0, 2),
                      blurRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Referrals and promos",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F1D1D),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    settingsTile(
                      iconPath: "assets/icons/gift.svg",
                      title: "Invite a friend to Wuffoos",
                      onTap: () {},
                    ),
                    SizedBox(height: 16.h),
                    settingsTile(
                      iconPath: "assets/icons/promoIcon.svg",
                      title: "Apply promo code",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              /// Settings Details
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Color(0xFFE3E6F0),
                    width: 0.6,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      offset: const Offset(0, 2),
                      blurRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F1D1D),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    settingsTile1(
                      title: "General",
                      onTap: () {},
                      textColor: Color(0xFF4D4D4D),
                    ),
                    SizedBox(height: 16.h),
                    settingsTile1(
                      title: "Account Settings",
                      onTap: () {},
                      textColor: Color(0xFF4D4D4D),
                    ),
                    SizedBox(height: 16.h),
                    settingsTile1(
                      title: "Log Out",
                      onTap: () {},
                      textColor: Color(0xFF4D4D4D),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Version",
                          style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4D4D4D),
                          ),
                        ),
                        Text(
                          "1.0.0(2025)",
                          style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4D4D4D),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 16.h),
                    settingsTile1(
                      title: "Update",
                      onTap: () {},
                      textColor: Color(0xFF4D4D4D),
                    ),
                    SizedBox(height: 16.h),
                    GestureDetector(
                      onTap: (){
                        _showDeleteDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Delete Account",
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Regular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors.red),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),

            ],
          ),
        ),
      ),
    );
  }

  Widget settingsTile({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(iconPath),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4D4D4D),
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFF4D4D4D)),
        ],
      ),
    );
  }

  Widget settingsTile1({
    required String title,
    required VoidCallback onTap,
    required textColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFF4D4D4D)),
        ],
      ),
    );
  }

  // -------------------- Delete Confirmation Dialog --------------------
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset("assets/icons/deleteIcon.svg"),
              ),
              SizedBox(height: 12.h),
              Text(
                "Delete Account",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF202020),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Are you sure to delete this account?",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF494949),
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: 'Prompt_regular',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        elevation: 0,
                      ),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontFamily: 'Prompt_regular',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}