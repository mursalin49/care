import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:petcare/view/bookings/booking_screen.dart';
import 'package:petcare/view/services/dog%20walking/dog_walking_screen.dart';
import 'package:petcare/view/services/doggy%20day%20care/doggy_day_care_screen.dart';
import '../../Controller/services/services_controller.dart';
import '../bookings/widgets/custom_booking_card.dart';
import 'boarding/boarding_screen.dart';


class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServicesController());

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
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/NotificationICon.svg",
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.041),

                    /// Boarding
                    Obx(() {
                      final isSelected = controller.selectedService.value == "Boarding";
                      return GestureDetector(
                        onTap: () {
                          controller.selectService("Boarding");
                          Get.to(() => const BoardingScreen());
                        },
                        child: _serviceContainer(
                          context,
                          iconPath: "assets/icons/boardingIcon.svg",
                          title: "Boarding",
                          subtitle: "In the sitter’s home",
                          isSelected: isSelected,
                        ),
                      );
                    }),
                    SizedBox(height: 16.h),

                    /// Doggy Day Care
                    Obx(() {
                      final isSelected = controller.selectedService.value == "Doggy Day Care";
                      return GestureDetector(
                        onTap: (){
                          controller.selectService("Doggy Day Care");
                          Get.to(() => DoggyDayCareScreen());
                        },
                        child: _serviceContainer(
                          context,
                          iconPath: "assets/icons/dayCareIcon.svg",
                          title: "Doggy Day Care",
                          subtitle: "In the sitter’s home",
                          isSelected: isSelected,
                        ),
                      );
                    }),
                    SizedBox(height: 16.h),

                    /// Dog Walking
                    Obx(() {
                      final isSelected = controller.selectedService.value == "Dog Walking";
                      return GestureDetector(
                        onTap: (){
                          controller.selectService("Dog Walking");
                          Get.to(() => DogWalkingScreen());
                        },
                        child: _serviceContainer(
                          context,
                          iconPath: "assets/icons/dogWalkIcon.svg",
                          title: "Dog Walking",
                          subtitle: "In your neighbourhood",
                          isSelected: isSelected,
                        ),
                      );
                    }),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.041),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Bookings",
                          style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 16.sp,
                            color: const Color(0xFF1F2937),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => BookingsScreen());
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontFamily: 'Montserrat-Regular',
                              fontSize: 14.sp,
                              color: const Color(0xFF7A7A7A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    ListView.builder(
                      itemCount: 12,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index){
                        String status;

                        if (index < 3) {
                          status = "On going";
                        } else if (index < 6) {
                          status = "Completed";
                        } else if (index < 9) {
                          status = "Cancelled";
                        } else {
                          status = "Upcoming";
                        }

                        return CustomBookingCard(
                          name: "Seam Rahman",
                          profileImage: "assets/images/profileImg.png",
                          rating: 3.8,
                          totalReviews: 1200,
                          date: "02/10/2025",
                          serviceType: "Dog Walking",
                          contactNumber: "01793396294",
                          bookingDate: "10/10/2025",
                          pickUpTime: "10:00 AM",
                          dropOffTime: "10:00 AM",
                          price: "99",
                          status: status,
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

  /// Reusable Service Container Widget
  Widget _serviceContainer(
      BuildContext context, {
        required String iconPath,
        required String title,
        required String subtitle,
        required bool isSelected,
      }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.mainAppColor.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.mainAppColor : const Color(0xFFE3E6F0),
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
      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
