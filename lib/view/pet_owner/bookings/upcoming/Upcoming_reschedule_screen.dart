import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_date_picker_sheet.dart';
import '../../../components/custom_time_picker_sheet.dart';
import '../../bookings/widgets/custom_calendar.dart';
import '../widgets/success_reschedule_dialog.dart';


class UpcomingRescheduleScreen extends StatefulWidget{
  const UpcomingRescheduleScreen({super.key});

  @override
  State<UpcomingRescheduleScreen> createState() => _UpcomingRescheduleScreenState();
}

class _UpcomingRescheduleScreenState extends State<UpcomingRescheduleScreen> {
  @override
  Widget build(BuildContext context) {

    DateTime? startDate;
    DateTime? endDate;
    TimeOfDay? startTime;
    TimeOfDay? endTime;

    // Set default values
    @override
    void initState() {
      super.initState();
      startDate = null;
      startTime = null;
      endDate = null;
      endTime = null;
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: "Reschedule",
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Pet sitter Availability",
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF111111),
                ),
              ),
              SizedBox(height: 18.h),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Color(0xFFFE6C5D),
                        borderRadius: BorderRadius.circular(5.r)
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "Booked",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF101010),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomCalendarWidget(
                unavailableDays: [
                  DateTime(2025, 11, 26),
                  DateTime(2025, 11, 29),
                  DateTime(2025, 11, 30),
                ],
                onDaySelected: (selectedDay) {
                  debugPrint('Selected: $selectedDay');
                },
              ),
              SizedBox(height: 16.h),
              Text(
                "Note",
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7A7A7A),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.mainAppColor, width: 1)
                ),
                child: Text(
                  "Please ensure all windows are securely locked after cleaning. Kindly use eco-friendly cleaning products as we prefer them.",
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4D4D4D),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      offset: const Offset(0, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    /// Row 1: Start Date - End Date
                    Row(
                      children: [
                        Expanded(
                          child: _buildDateField(
                            label: 'Start date',
                            date: startDate,
                            placeholder: "Select start date",
                            onTap: () async {
                              final DateTime? picked =
                              await showCustomDatePickerSheet(
                                context,
                                initialDate: startDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                              );
                              if (picked != null && picked != startDate) {
                                setState(() {
                                  startDate = picked;
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildDateField(
                            label: 'End date',
                            date: startDate,
                            placeholder: "Select end date",
                            onTap: () async {
                              final DateTime? picked =
                              await showCustomDatePickerSheet(
                                context,
                                initialDate: startDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                              );
                              if (picked != null && picked != startDate) {
                                setState(() {
                                  startDate = picked;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    /// Row 2: Start Time - End Time
                    Row(
                      children: [
                        Expanded(
                          child: _buildTimeField(
                            label: "Start time",
                            time: startTime,
                            placeholder: "Select start time",
                            onTap: () async {
                              final TimeOfDay? picked =
                              await showCustomTimePickerSheet(
                                context,
                                initialTime: startTime ?? TimeOfDay.now(),
                              );
                              if (picked != null && picked != startTime) {
                                setState(() {
                                  startTime = picked;
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildTimeField(
                            label: "End time",
                            placeholder: "Select end time",
                            time: endTime,
                            onTap: () async {
                              final TimeOfDay? picked =
                              await showCustomTimePickerSheet(
                                context,
                                initialTime: endTime ?? TimeOfDay.now(),
                              );
                              if (picked != null && picked != endTime) {
                                setState(() {
                                  endTime = picked;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              /// Button section Row
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Color(0xFFFE6C5D))
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFE6C5D),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 18.h),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        showRescheduleSuccessDialog(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.mainAppColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "Send",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12.h),
              Center(
                child: Text(
                  "You can reschedule the time only once.",
                  style: GoogleFonts.inter(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFE6C5D),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.040),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateField({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
    String? placeholder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Montserrat-Regular',
            fontSize: 14.sp,
            color: const Color(0xFF101010),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Color(0xFFE5E5E5), width: 1),
            ),
            child: Text(
              date != null
                  ? DateFormat('dd/MM/yyyy').format(date)
                  : (placeholder ?? ''),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: date != null ? Color(0xFF1F1D1D) : Color(0xFF757575),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeField({
    required String label,
    required TimeOfDay? time,
    required VoidCallback onTap,
    String? placeholder,
  }) {
    String formatTimeOfDay(TimeOfDay tod) {
      final hour = tod.hourOfPeriod == 0 ? 12 : tod.hourOfPeriod;
      final minute = tod.minute.toString().padLeft(2, '0');
      final period = tod.period == DayPeriod.am ? 'AM' : 'PM';
      return '$hour:$minute $period';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Montserrat-Regular',
            fontSize: 14.sp,
            color: const Color(0xFF101010),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Color(0xFFE5E5E5), width: 1),
            ),
            child: Text(
              time != null ? formatTimeOfDay(time) : (placeholder ?? ''),
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: time != null ? Color(0xFF1F1D1D) : Color(0xFF757575),
              ),
            ),
          ),
        ),
      ],
    );
  }
}