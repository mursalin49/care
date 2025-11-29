import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:get/get.dart';

import '../sitter_profile_details_screen.dart';


class SittersProfileCard extends StatelessWidget{
  final String name;
  final String imgUrl;
  final String shortIntro;
  final String price;
  final String reviews;
  final String availability;

  const SittersProfileCard({super.key, required this.name, required this.shortIntro, required this.price, required this.reviews, required this.availability, required this.imgUrl});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => SitterProfileDetailsScreen());
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE3E6F0)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.20),
              offset: Offset(0, 2),
              blurRadius: 4,
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 23.r,
                        backgroundImage: AssetImage(imgUrl),
                      ),
                      SizedBox(width: 17.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontFamily: 'Montserrat-Regular',
                                fontSize: 14.sp,
                                color: Color(0xFF101010),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              shortIntro,
                              style: TextStyle(
                                fontFamily: 'Montserrat-Regular',
                                fontSize: 12.sp,
                                color: Color(0xFF111111),
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis, // ✅ to clip long text
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 16.sp,
                    color: AppColors.mainAppColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            SizedBox(height: 18.h),
            Row(
              children: [
                Icon(Icons.star, size: 15),
                SizedBox(width: 5.w),
                Text(
                  reviews,
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 12.sp,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                SvgPicture.asset("assets/icons/repeatIcon.svg"),
                SizedBox(width: 2.w),
                Text(
                  "Repeat pet owners",
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 12.sp,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            SizedBox(height: 6.h),
            Row(
              children: [
                SvgPicture.asset("assets/icons/doneIcon.svg"),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      availability,
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 12.sp,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "(3 booked, 2 remaining)",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 12.sp,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            )

          ],
        ),
      ),
    );
  }

}