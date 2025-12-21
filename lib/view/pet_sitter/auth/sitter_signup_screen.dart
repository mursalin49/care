import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../helpers/route.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../components/custom_text_field.dart';
import '../../pet_owner/auth/widget/custom_dropdown.dart';
import '../profile/terms_condition_screen.dart';

class SitterSignUpScreen extends StatefulWidget{
  const SitterSignUpScreen({super.key});

  @override
  State<SitterSignUpScreen> createState() => _SitterSignUpScreenState();
}

class _SitterSignUpScreenState extends State<SitterSignUpScreen> {
  bool agree = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  String selectedLanguage = 'English';

  String? selectedType = 'LinkedIn';
  final List<String> type = ['Facebook', 'Instagram', 'LinkedIn', 'Twitter (X)', 'YouTube', 'TikTok'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.035),
              SvgPicture.asset("assets/images/appLogo.svg"),
              SizedBox(height: 10.h),

              Text(
                "Hello,Welcome to wuffoos",
                style: TextStyle(
                  fontFamily: 'BaksoSapi',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainAppColor,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.065),

              Container(
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  border: const Border(
                    top: BorderSide(
                      color: AppColors.mainAppColor,
                      width: 1,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.040),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: 'BaksoSapi',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "It only takes a minute to create your\naccount",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF5E5E5E),
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                      Text(
                        "Enter your Name",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        textEditingController: nameController,

                        hintText: 'Enter your Name',
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: AppColors.mainAppColor,
                        ),
                        fillColor: Color(0xFFFFFFFF),
                        fieldBorderColor: AppColors.borderColor,
                      ),
                      SizedBox(height: 16.h,),


                      Text(
                        "Enter your e-mail address",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        textEditingController: emailController,
                        hintText: 'Enter your e-mail address',
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: AppColors.mainAppColor,
                        ),
                        fillColor: Color(0xFFFFFFFF),
                        fieldBorderColor: AppColors.borderColor,
                      ),
                      SizedBox(height: 16.h,),

                      Text(
                        "Enter your phone number",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        textEditingController: phoneNumController,
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: AppColors.mainAppColor,
                        ),
                        fillColor: Color(0xFFFFFFFF),
                        fieldBorderColor: AppColors.borderColor,
                      ),
                      SizedBox(height: 16.h,),

                      Text(
                        "Enter your Password",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        textEditingController: passController,
                        hintText: 'Enter your Password',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: AppColors.mainAppColor,
                        ),
                        isPassword: true,
                        fillColor: Color(0xFFFFFFFF),
                        fieldBorderColor: AppColors.mainAppColor,
                      ),
                      SizedBox(height: 16.h),

                      Text(
                        "Select your comfortable language",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // English button
                          Expanded(
                            child: LanguageCard(
                              flag: SvgPicture.asset('assets/icons/flagIcon.svg', width: 26.w, height: 26.h),
                              title: 'English',
                              isSelected: selectedLanguage == 'English',
                              onTap: () {
                                setState(() => selectedLanguage = 'English');
                              },
                            ),
                          ),
                          SizedBox(width: 15),
                          // Spanish button
                          Expanded(
                            child: LanguageCard(
                              flag: SvgPicture.asset('assets/icons/maxflag.svg', width: 26.w, height: 26.h),
                              title: 'Spanish',
                              isSelected: selectedLanguage == 'Spanish',
                              onTap: () {
                                setState(() => selectedLanguage = 'Spanish');
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),


                      Text(
                        "How did you hear about us? (Optional)",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                      SizedBox(height: 8.h),


                      Stack(
                        alignment: Alignment.centerRight,
                        children: [

                          CustomDropdownHome(
                            items: type,
                            selectedItem: selectedType,
                            onItemSelected: (newValue) {
                              setState(() {
                                selectedType = newValue;
                              });
                            },
                          ),


                          Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 24.sp,
                              color: Color(0xFF5E5E5E),
                            ),
                          ),
                        ],
                      ),


                      SizedBox(height: 16.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => agree = !agree),
                            child: Container(
                              height: 18.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.mainAppColor, width: 1.5),
                                borderRadius: BorderRadius.circular(4),
                                color: agree ? AppColors.mainAppColor : Colors.transparent,
                              ),
                              child: agree
                                  ? SvgPicture.asset(
                                "assets/icons/checkIcon.svg",
                                height: 14.h,
                                width: 14.w,

                              )
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Get.offNamed(AppRoutes.privacy);

                            },
                            child: Text(
                              'Accept Privacy Statement',
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.mainAppColor,
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => agree = !agree),
                            child: Container(
                              height: 18.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.mainAppColor, width: 1.5),
                                borderRadius: BorderRadius.circular(4),
                                color: agree ? AppColors.mainAppColor : Colors.transparent,
                              ),
                              child: agree
                                  ? SvgPicture.asset(
                                "assets/icons/checkIcon.svg",
                                height: 14.h,
                                width: 14.w,

                              )
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Get.offNamed(AppRoutes.sitterTerms);
                            },
                            child: Text(
                              'Accept Terms & Conditions',
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.mainAppColor,
                              ),
                            ),
                          ),

                        ],
                      ),



                      SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                      GestureDetector(
                        onTap: (){
                          Get.offNamed(AppRoutes.sitterLoginScreen);
                          print("Tap------------------------------");
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            color: AppColors.mainAppColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontFamily: 'BaksoSapi',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1.5,
                              color: Color(0xFFB1B1B1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              "Or Continue With",
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF303030),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1.5,
                              color: Color(0xFFB1B1B1),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Google Button
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF0B0E12).withOpacity(0.20),
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: IconButton(
                              onPressed: () async {

                              },
                              icon: SvgPicture.asset(AppIcons.googleIcon, width: 20, height: 20),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ),

                          SizedBox(width: 10.w),

                          // apple Button
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF0B0E12).withOpacity(0.20),
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: IconButton(
                              onPressed: () async {

                              },
                              icon: SvgPicture.asset(AppIcons.appleIcon, width: 20, height: 20),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ),

                          SizedBox(width: 10.w),

                          // Facebook Button
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF0B0E12).withOpacity(0.20),
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: IconButton(
                              onPressed: () async {

                              },
                              icon: SvgPicture.asset(AppIcons.fbIcon, width: 20, height: 20),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),


              SizedBox(height: MediaQuery.of(context).size.height * 0.030),

            ],
          ),
        ),
      ),
    );
  }
}

class LanguageCard extends StatelessWidget {
  final Widget flag;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageCard({
    super.key,
    required this.flag,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF005D6C) : Colors.white,
          borderRadius: BorderRadius.circular(8.r), 
          border: Border.all(
            color: AppColors.mainAppColor,
            width: 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
          ],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              flag, // now a proper widget
              SizedBox(width: 8.w),
              Text(
                title,
                style: GoogleFonts.inter( 
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Color(0xFF035F75),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}