import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petcare/view/pet_owner/services/boarding/boarding_filtering_screen.dart';
import 'package:petcare/view/pet_owner/services/doggy%20day%20care/day_care_filtering_screen.dart';
import '../../../../utils/app_colors.dart';
import 'package:get/get.dart';


class SitterInAreaForBoarding extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// Header Section
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: AppColors.mainAppColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.r),
                bottomRight: Radius.circular(32.r),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20.h, right: 20.w, top: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        "assets/icons/backIcon.svg",
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      "Sitters in your area",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 18.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => BoardingFilteringScreen());
                      },
                      child: SvgPicture.asset(
                        "assets/icons/filterIcon.svg",
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20.w,right: 20.w, bottom: 20),
              child: Image.asset(
                "assets/images/liveLocationImg.png",
                fit: BoxFit.cover,
              ),
            ),
          )

        ],
      ),
    );
  }

}