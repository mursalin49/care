import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:petcare/view/components/custom_app_bar.dart';

import '../components/custom_text_field.dart';

class CardDetailsScreen extends StatelessWidget{
  CardDetailsScreen({super.key});


  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        title: "Card Details",
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.030),
              Text(
                "Please enter payment information",
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF585858),
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 16.h),

              customTitleTile(title: "Name of Card"),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: nameController,
                hintText: 'Name of card',
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xFF5E5E5E),
                ),
              ),
              SizedBox(height: 16.h),

              customTitleTile(title: "Card Number"),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: nameController,
                hintText: '1234  5678  9101  1121',
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xFF5E5E5E),
                ),
              ),
              SizedBox(height: 16.h),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTitleTile(title: "Expiration Date"),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          textEditingController: nameController,
                          hintText: 'MM/YY',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Color(0xFF5E5E5E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTitleTile(title: "CVV"),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          textEditingController: nameController,
                          hintText: '123',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Color(0xFF5E5E5E),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),

              customTitleTile(title: "Country"),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: nameController,
                hintText: 'Bangladesh',
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xFF5E5E5E),
                ),
              ),
              SizedBox(height: 16.h),

              customTitleTile(title: "Street Name And Number"),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: nameController,
                hintText: 'Street Name And Number',
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xFF5E5E5E),
                ),
              ),
              SizedBox(height: 16.h),

              customTitleTile(title: "Additional Address Details (optional)"),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: nameController,
                hintText: 'Additional Address Details (optional)',
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xFF5E5E5E),
                ),
              ),
              SizedBox(height: 16.h),

              customTitleTile(title: "City/Town"),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: nameController,
                hintText: 'City/Town',
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xFF5E5E5E),
                ),
              ),
              SizedBox(height: 16.h),

              customTitleTile(title: "Postcode"),
              SizedBox(height: 8.h),
              CustomTextField(
                textEditingController: nameController,
                hintText: '89739',
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xFF5E5E5E),
                ),
              ),
              SizedBox(height: 16.h),

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
                    "Save",
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE6E6E6),
                    ),
                    textAlign: TextAlign.center,
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

  /// Reusable Title Text
  Widget customTitleTile({required String title}) {
    return Text(
      title,
      style: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }

}