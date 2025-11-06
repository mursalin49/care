import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/utils/app_colors.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 25.r,
                            backgroundImage: AssetImage('assets/images/profileImg.png'),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning",
                              style: TextStyle(
                                fontFamily: 'Montserrat-Regular',
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Seam Rahman",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("assets/icons/NotificationICon.svg", width: 24.w, height: 24.h)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /// Scrollable content here
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.041),

                    ///  Boarding Section
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFFE3E6F0), width: 0.6),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF000000).withOpacity(0.10),
                              offset: Offset(0, 2),
                              blurRadius: 2,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/boardingIcon.svg", width: 24.w, height: 24.h),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Boarding",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "In the sitter’s home",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ),
                    ),
                    SizedBox(height: 16.h),

                    ///  Day care Section
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xFFE3E6F0), width: 0.6),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF000000).withOpacity(0.10),
                                offset: Offset(0, 2),
                                blurRadius: 2,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/dayCareIcon.svg", width: 24.w, height: 24.h),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Doggy Day Care",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat-Regular',
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "In the sitter’s home",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat-Regular',
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 16.h),

                    ///  Dog Walking Section
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xFFE3E6F0), width: 0.6),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF000000).withOpacity(0.10),
                                offset: Offset(0, 2),
                                blurRadius: 2,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/dogWalkIcon.svg", width: 24.w, height: 24.h),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dog Walking",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat-Regular',
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "In your neighbourhood",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat-Regular',
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.041),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Bookings",
                          style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 16.sp,
                            color: Color(0xFF1F2937),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontFamily: 'Montserrat-Regular',
                              fontSize: 14.sp,
                              color: Color(0xFF7A7A7A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
