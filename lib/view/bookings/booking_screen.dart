import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/Controller/bookings/booking_status_controller.dart';
import 'package:petcare/view/bookings/upcoming/upcoming_details_screen.dart';
import 'package:petcare/view/bookings/widgets/custom_booking_card.dart';
import 'package:petcare/view/components/custom_app_bar.dart';
import '../../utils/app_colors.dart';
import 'package:get/get.dart';

import 'cancelled/cancelled_details_screen.dart';
import 'completed/completed_details_screen.dart';
import 'on_going/ongoing_details_screen.dart';

class BookingsScreen extends StatefulWidget{
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {

  final BookingStatusController controller = Get.put(BookingStatusController());

  final List<String> statuses = [
    'On going',
    'Completed',
    'Cancelled',
    'Upcoming',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: "Order history", showBackButton: false),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          /// ----------------------------------------- Status Section ----------------------------

          Obx(() => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: List.generate(statuses.length, (index) {
                    final status = statuses[index];
                    final bool isSelected = controller.selectedStatus.value == status;

                    return GestureDetector(
                      onTap: () => controller.selectStatus(status),
                      child: Container(
                        margin: EdgeInsets.only(right: 8.w),
                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: isSelected? AppColors.mainAppColor : Colors.white,
                          border: Border.all(
                            color: AppColors.mainAppColor,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            color: isSelected ? Colors.white : AppColors.mainAppColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            )
          ),
          SizedBox(height: 16.h),

          /// ----------------------------------------- Booking Section ----------------------------
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                itemCount: 12,
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
                    onTap: () {
                      // Navigation based on status
                      if (status == "On going") {
                        Get.to(() => OngoingDetailsScreen());
                      } else if (status == "Completed") {
                        Get.to(() => CompletedDetailsScreen());
                      } else if (status == "Cancelled") {
                        Get.to(() => CancelledDetailsScreen());
                      } else if (status == "Upcoming") {
                        Get.to(() => UpcomingDetailsScreen());
                      }
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

