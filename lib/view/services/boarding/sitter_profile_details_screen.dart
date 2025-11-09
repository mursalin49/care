import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:petcare/view/components/custom_app_bar.dart';

class SitterProfileDetailsScreen extends StatefulWidget{
  const SitterProfileDetailsScreen({super.key});

  @override
  State<SitterProfileDetailsScreen> createState() => _SitterProfileDetailsScreenState();
}

class _SitterProfileDetailsScreenState extends State<SitterProfileDetailsScreen> {

  final List<String> filters = [
    "Top Rated",
    "Quick Responder",
    "Experienced",
    "Background Check",
  ];

  final Set<String> selectedFilters = {"Background Check"};




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sitter Profile",
        showBackButton: true,
      ),
      body: Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.031),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: AssetImage("assets/images/profileImg.png"),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Seam Rahman",
                          style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 18.sp,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/locationIcon.svg", color: AppColors.mainAppColor,  width: 18, height: 18),
                            SizedBox(width: 4.w),
                            Text(
                              "New York",
                              style: TextStyle(
                                fontFamily: 'Montserrat-Regular',
                                fontSize: 12.sp,
                                color: Color(0xFF585858),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/reviewIcon.svg", width: 18, height: 18),
                            SizedBox(width: 4.w),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Regular',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF585858),
                                ),
                                children: [
                                  TextSpan(
                                    text: '4.5',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const TextSpan(text: ' (42 reviews)'),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    )
                  ],
                ),
                SizedBox(height: 18.h),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: filters.map((filter) {
                    final bool isSelected = selectedFilters.contains(filter);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedFilters.remove(filter);
                          } else {
                            selectedFilters.add(filter);
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.green.withOpacity(0.05)
                              : Colors.white,
                          border: Border.all(
                            color: isSelected
                                ? Colors.green
                                : Colors.grey.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (isSelected)
                              Icon(Icons.check_circle,
                                  color: Colors.green, size: 18.sp),
                            if (isSelected) SizedBox(width: 6.w),
                            Text(
                              filter,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 18.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}