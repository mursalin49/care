import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcare/view/pet_owner/services/boarding/widget/sitters_profile_card.dart';

import '../../../../utils/app_colors.dart';
import 'boarding_filtering_screen.dart';

class BoardingSittersScreen extends StatelessWidget {
  const BoardingSittersScreen({super.key});

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
                      "Boarding",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 18.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => BoardingFilteringScreen());
                          },
                          child: SvgPicture.asset(
                            "assets/icons/filterIcon.svg",
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/icons/locationIcon.svg",
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          /// Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/verifyIcon.svg"),
                        SizedBox(width: 5.w),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Montserrat-Regular',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            children: [
                              const TextSpan(text: 'We '),
                              TextSpan(
                                text: 'Verify the identity',
                                style: TextStyle(
                                  color: AppColors.mainAppColor,
                                ),
                              ),
                              const TextSpan(text: ' of every sitter.'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    /// sitter list
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 20,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SittersProfileCard(
                          name: "Seam Rahman",
                          shortIntro: "Love animals, animals is everything",
                          price: "\$25/h",
                          reviews: "5.0 (55 reviews)",
                          availability: "Still available for 2 more pets today",
                          imgUrl: "assets/images/profileImg.png",
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
