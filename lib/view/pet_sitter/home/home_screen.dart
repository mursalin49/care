import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/Controller/sitter/sitter_booking_service_controller.dart';
import 'package:petcare/Controller/sitter/sitter_bookingstatus_controller.dart';
import 'package:petcare/view/pet_owner/bookings/widgets/custom_calendar.dart';
import 'package:petcare/view/pet_sitter/bookings/booking_screen.dart';
import 'package:petcare/view/pet_sitter/home/sitter_notification_screen.dart';
import '../../../utils/app_colors.dart';
import '../bookings/models/model.dart';

// The user removed local stat card widget but implemented it inline or helper.
// I will keep the inline implementation but integrated.

class SitterHomeScreen extends StatefulWidget {
  const SitterHomeScreen({super.key});

  @override
  State<SitterHomeScreen> createState() => _SitterHomeScreenState();
}

class _SitterHomeScreenState extends State<SitterHomeScreen> {
  late SitterBookingStatusController controller;
  late SitterBookingServiceController bookingService;

  @override
  void initState() {
    super.initState();
    controller = Get.put(SitterBookingStatusController());
    bookingService = Get.put(SitterBookingServiceController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: _buildCustomAppBar(),
      body: Stack(
        children: [
          // --- Foreground Content ---
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                _buildStatCards(),
                SizedBox(height: 24.h),

                // Booked Section Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.redColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Booked',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),
                // Calendar Widget
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomCalendarWidget(
                    unavailableDays: [
                      DateTime.now().add(const Duration(days: 1)),
                      DateTime.now().add(const Duration(days: 2)),
                    ],
                    onDaySelected: (day) {},
                  ),
                ),
                SizedBox(height: 24.h),
                _buildRecentBookings(),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentBookings() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Bookings',
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainAppColor,
                ),
              ),
              TextButton(
                onPressed: () => Get.to(() => const SitterBookingsScreen()),
                child: Text(
                  'See all',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainAppColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          Obx(() {
            List<BookingData> displayList = bookingService.bookings.toList();

            if (displayList.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    "No bookings found.",
                    style: GoogleFonts.montserrat(
                      color: AppColors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                final booking = displayList[index];
                return HomeBookingCard(booking: booking);
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildStatCards() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1.5,
        children: [
          _statCardItem(
            'Total Bookings',
            '800',
            AppColors.mainAppColor,
            const Color(0xFFE7F4F6),
          ),
          _statCardItem(
            'On going services',
            '06',
            AppColors.blueColor,
            AppColors.blueColor.withOpacity(0.04),
          ),
          _statCardItem(
            'Completed services',
            '400',
            AppColors.greenColor,
            AppColors.greenColor.withOpacity(0.04),
          ),
          _statCardItem(
            'Upcoming services',
            '14',
            AppColors.redColor,
            AppColors.redColor.withOpacity(0.04),
          ),
        ],
      ),
    );
  }

  Widget _statCardItem(String title, String count, Color color, Color bgColor) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: GoogleFonts.montserrat(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.mainAppColor,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildCustomAppBar() {
    return AppBar(
      backgroundColor: AppColors.mainAppColor,
      elevation: 0,
      toolbarHeight: 80.h,
      automaticallyImplyLeading: false,

      title: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/images/n.png'),
            ),
          ),
          SizedBox(width: 12.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                'Seam Rahman',
                style: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),

      actions: [
        IconButton(
          onPressed: () => Get.to(() => const SitterNotificationScreen()),
          icon: SvgPicture.asset(
            'assets/icons/notifica.svg',
            width: 32,
            height: 32,
          ),
        ),
        SizedBox(width: 12.w),
      ],

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
    );

  }
}

// --- Home Booking Card based on User Design ---
class HomeBookingCard extends StatelessWidget {
  final BookingData booking; // Use BookingData from models
  const HomeBookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h), // Added margin for spacing in List
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundImage: AssetImage(booking.userProfileImage),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.userName,
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainAppColor,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          height: 14.h,
                          width: 14.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          booking.location,
                          style: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Use pickup time as the time indicator
              Text(
                booking.pickupTime,
                style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                booking.service,
                style: GoogleFonts.montserrat(
                  color: AppColors.mainAppColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
              // Display hourly rate if available or some price info
              Text(
                "\$20/hr",
                style: GoogleFonts.montserrat(
                  color: AppColors.mainAppColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              booking.date,
              style: GoogleFonts.montserrat(
                color: Colors.grey,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              _infoBox("For 2 hours"), // Placeholder for duration
              SizedBox(width: 10.w),
              _infoBox(booking.price, isBold: true),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    booking.petImage,
                    width: 40.w,
                    height: 40.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.petName,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                      Text(
                        booking.petBreed,
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: _btn("Cancel", const Color(0xFFFF7061)),
              ), // Changed Cancel to Decline for HomeScreen context usually
              SizedBox(width: 12.w),
              Expanded(child: _btn("Accept", AppColors.mainAppColor)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoBox(String val, {bool isBold = false}) => Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Text(
          val,
          style: GoogleFonts.montserrat(
            color: isBold ? AppColors.mainAppColor : AppColors.mainAppColor,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    ),
  );

  Widget _btn(String txt, Color col) => SizedBox(
    height: 45.h,
    child: ElevatedButton(
      onPressed: () {
        if (txt == "Cancel") {
          Get.dialog(
            Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Are you sure you want to cancel the booking?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainAppColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.back(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.redColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "No",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back(); // Close dialog
                              // Add cancellation logic here if needed
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainAppColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Yes",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (txt == "Accept") {
          Get.to(() => const SitterBookingsScreen());
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: col,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        txt,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
