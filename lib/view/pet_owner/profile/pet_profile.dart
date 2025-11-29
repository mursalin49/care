import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:get/get.dart';

class PetProfileScreen extends StatelessWidget{
  PetProfileScreen({super.key});

  final pet = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
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
                      "Doggy Day Care",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 18.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: SvgPicture.asset(
                        "assets/icons/editIcon.svg",
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 163.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        image: DecorationImage(
                          image: (pet.imagePath != null && pet.imagePath!.isNotEmpty)
                              ? FileImage(File(pet.imagePath!))
                              : AssetImage("assets/images/pet_placeholder.png") as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text("Name: ${pet.name ?? ""}"),
                    Text("Type: ${pet.type ?? ""}"),
                    Text("Breed: ${pet.breed ?? ""}"),
                    Text("Age: ${pet.ageYear ?? 0} years, ${pet.ageMonth ?? 0} months"),

                  ],
                ),
              ),
            ),
          )


        ],
      ),
    );
  }

}