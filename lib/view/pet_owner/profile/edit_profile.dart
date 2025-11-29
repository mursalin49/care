import 'package:flutter/material.dart';
import '../../../Controller/profile/edit_profile_controller.dart';
import '../../../utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../components/custom_app_bar.dart';
import '../../components/custom_text_field.dart';


class EditProfileScreen extends StatefulWidget{
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final EditProfile _controller = Get.put(EditProfile());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController _dobCtrl = TextEditingController();


  /// For pic Date of birth
  Future<void> _pickDob() async {
    final DateTime now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1990),
      lastDate: now,
    );
    if (picked != null) {
      final formatted = DateFormat('yyyy-MM-dd').format(picked);
      _dobCtrl.text = formatted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        title: "Edit Profile",
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.055),
              Center(
                child: Stack(
                  children: [
                    Obx(() {
                      return Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.mainAppColor,
                            width: 1.5,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 56.r,
                          backgroundImage: _controller.selectedImageEDT.value != null
                              ? FileImage(_controller.selectedImageEDT.value!)
                              : AssetImage("assets/images/profileImg.png") as ImageProvider,
                        ),
                      );
                    }),
                    Positioned(
                      bottom: 5,
                      right: 2,
                      child: GestureDetector(
                        onTap: (){
                          _controller.pickImage(ImageSource.gallery);
                        },
                        child: SvgPicture.asset("assets/icons/inputImageIcon.svg", width: 28.w, height: 28.h),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.030),

              Text(
                "Full Name",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B4237),
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: nameController,
                hintText: 'Name',
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
                "E-mail address",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B4237),
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: emailController,
                hintText: 'E-mail address',
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
                "Phone number",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B4237),
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: phoneController,
                hintText: 'Enter your phone number',
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
                "Date of birth",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B4237),
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: _dobCtrl,
                hintText: 'DD/MM/YY',
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xFF5E5E5E),
                ),
                readOnly: true,
                onTap: (){
                  _pickDob();
                },
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: Color(0xFF585858),
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

