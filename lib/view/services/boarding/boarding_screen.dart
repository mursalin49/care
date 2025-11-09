import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/view/components/custom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:petcare/view/services/boarding/boarding_sitters_screen.dart';
import '../../../utils/app_colors.dart';
import '../../components/custom_date_picker_sheet.dart';
import '../../components/custom_time_picker_sheet.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Boarding", showBackButton: true),
      body: Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.031),

                Text(
                  "When do you need a sitter?",
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 18.sp,
                    color: Color(0xFF111111),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 18.h),
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

                GestureDetector(
                  onTap: () {},
                  child: DottedBorder(
                    color: AppColors.mainAppColor,
                    strokeWidth: 1.5,
                    dashPattern: const [7, 3],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: AppColors.mainAppColor, size: 20),
                          SizedBox(width: 8.w),
                          const Text(
                            "Select your pets",
                            style: TextStyle(
                              fontFamily: 'Montserrat-Regular',
                              fontSize: 16,
                              color: AppColors.mainAppColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                CustomCalendarWidget(
                  unavailableDays: [
                    DateTime(2025, 11, 12),
                    DateTime(2025, 11, 13),
                    DateTime(2025, 11, 14),
                  ],
                  onDaySelected: (selectedDay) {
                    debugPrint('Selected: $selectedDay');
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                GestureDetector(
                  onTap: (){
                    Get.to(() => const BoardingSittersScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                      color: AppColors.mainAppColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.050),
              ],
            ),
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

class CustomCalendarWidget extends StatefulWidget {
  final List<DateTime> unavailableDays;
  final Function(DateTime)? onDaySelected;

  const CustomCalendarWidget({
    super.key,
    required this.unavailableDays,
    this.onDaySelected,
  });

  @override
  State<CustomCalendarWidget> createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CustomCalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool _isUnavailable(DateTime day) {
    return widget.unavailableDays.any(
      (d) => d.year == day.year && d.month == day.month && d.day == day.day,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TableCalendar(
        firstDay: DateTime.now(),
        lastDay: DateTime(2030),
        focusedDay: _focusedDay,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarFormat: CalendarFormat.month,
        onPageChanged: (focusedDay) {
          final now = DateTime.now();
          if (focusedDay.isBefore(DateTime(now.year, now.month))) {
            setState(() => _focusedDay = DateTime(now.year, now.month));
          } else {
            setState(() => _focusedDay = focusedDay);
          }
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: const Icon(Icons.chevron_left, size: 24),
          rightChevronIcon: const Icon(Icons.chevron_right, size: 24),
          titleTextStyle: TextStyle(
            fontFamily: 'Montserrat-Regular',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF11293A),
          ),
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontFamily: 'Montserrat-Regular',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF11293A),
          ),
          weekendStyle: TextStyle(
            fontFamily: 'Montserrat-Regular',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF11293A),
          ),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: AppColors.mainAppColor,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: AppColors.mainAppColor,
            shape: BoxShape.circle,
          ),
          outsideDaysVisible: true,
          defaultTextStyle: const TextStyle(color: Colors.black87),
          weekendTextStyle: const TextStyle(color: Colors.black87),
        ),
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          if (!_isUnavailable(selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            widget.onDaySelected?.call(selectedDay);
          }
        },
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            // Red-mark unavailable days
            if (_isUnavailable(day)) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Color(0xFFFE6C5D),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }

            // Normal day cell
            return Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
