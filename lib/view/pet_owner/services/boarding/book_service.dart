import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Controller/services/pet_selection_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../components/custom_app_bar.dart';
import 'package:get/get.dart';
import '../../../components/custom_date_picker_sheet.dart';
import '../../../components/custom_time_picker_sheet.dart';
import '../../../pet_owner/services/boarding/widget/custom_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';



class BookingServiceForBoarding extends StatefulWidget{
  const BookingServiceForBoarding({super.key});

  @override
  State<BookingServiceForBoarding> createState() => _BookingServiceForBoardingState();
}

class _BookingServiceForBoardingState extends State<BookingServiceForBoarding> {

  final _bathing = ValueNotifier<bool>(true);
  final _picupAndDropoff = ValueNotifier<bool>(false);
  final _extendedCare = ValueNotifier<bool>(true);


  String? selectedOptions;
  final petController = Get.put(PetSelectionController());

  final List<String> options = [
    "Boarding",
    "Doggy Day Care",
    "Dog Walking"
  ];

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
      appBar: CustomAppBar(
        title: "Book Service",
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.031),

              /// Profile Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage("assets/images/profileImg.png"),
                  ),
                  SizedBox(width: 16.w),

                  Expanded(   // <-- ADD THIS
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Boarding",
                          style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 18.sp,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// REVIEW
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/reviewIcon.svg",
                                    width: 18, height: 18),
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

                            /// LOCATION
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/locationIcon.svg",
                                  color: AppColors.mainAppColor,
                                  width: 18, height: 18,
                                ),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.031),

              /// Dropdown
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFF9ABFC8), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.20),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    )
                  ],
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(12.r),
                      dropdownColor: AppColors.white,
                      isExpanded: true,
                      hint: Text(
                        "Select an Option",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),

                      value: selectedOptions,
                      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF757575), size: 30,),
                      items: options.map((String member) {
                        return DropdownMenuItem<String>(
                          value: member,
                          child: Text(
                            member,
                            style: TextStyle(
                              fontFamily: 'Montserrat-Regular',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOptions = newValue;
                        });
                      },
                    ),
                  ),
              ),
              SizedBox(height: 24.h),

              /// List of selected pet
              Obx(() {
                if (petController.confirmedPets.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Column(
                  children: [
                    ...petController.confirmedPets.map((pet) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.mainAppColor, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(pet["image"]!),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pet["name"]!,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat-Regular',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    pet["breed"]!,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat-Regular',
                                      fontSize: 13.sp,
                                      color: Color(0xFF7A7A7A),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // IconButton(
                            //   icon: Icon(Icons.close, color: Colors.redAccent),
                            //   onPressed: () => petController.removePet(pet),
                            // ),
                          ],
                        ),
                      );
                    }),
                  ],
                );
              }),
              SizedBox(height: 16.h),

              /// Calendar section
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
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
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF101010),
                      )
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              CustomCalendarWidget(
                unavailableDays: [
                  DateTime(2025, 12, 5),
                  DateTime(2025, 12, 6),
                  DateTime(2025, 12, 7),
                ],
                onDaySelected: (selectedDay) {
                  debugPrint('Selected: $selectedDay');
                },
              ),
              SizedBox(height: 12.h),

              /// ---------------------------------- Date & time section section -----------------------------///
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
              SizedBox(height: 12.h),

              /// Contract
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Contact",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF101010),
                        )
                    ),
                    SizedBox(height: 12.h),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFE3E6F0)),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/homeIcon.svg"),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Address",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF101010),
                                  )
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                  "Home",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF101010),
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFE3E6F0)),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/phoneIcon.svg"),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Phone Number",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF101010),
                                  )
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                  "01232442342",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF101010),
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              /// Service
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Service",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF101010),
                        )
                    ),
                    SizedBox(height: 18.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customTitleTile(title: "Bathing/ Grooming"),
                        AdvancedSwitch(
                          activeColor: AppColors.mainAppColor,
                          inactiveColor: Color(0xFF787880).withOpacity(0.16),
                          width: 48.w,
                          height: 25.h,
                          controller: _bathing,
                          borderRadius: BorderRadius.circular(77),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customTitleTile(title: "Sitter Pick-Up and Drop-Off"),
                        AdvancedSwitch(
                          activeColor: AppColors.mainAppColor,
                          inactiveColor: Color(0xFF787880).withOpacity(0.16),
                          width: 48.w,
                          height: 25.h,
                          controller: _picupAndDropoff,
                          borderRadius: BorderRadius.circular(77),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customTitleTile(title: "Extended Care"),
                        AdvancedSwitch(
                          activeColor: AppColors.mainAppColor,
                          inactiveColor: Color(0xFF787880).withOpacity(0.16),
                          width: 48.w,
                          height: 25.h,
                          controller: _extendedCare,
                          borderRadius: BorderRadius.circular(77),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              /// Note
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Note",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF101010),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.mainAppColor),
                      ),
                      child: Text(
                        "Please ensure all windows are securely locked after cleaning.Kindly use eco-friendly cleaning products as we prefer them.",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4D4D4D)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              /// Pricing
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pricing",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF101010),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    customTitleTile1(
                      title: "Bathing / Grooming",
                      price: "\$60.00",
                    ),
                    SizedBox(height: 8.h),
                    customTitleTile1(
                      title: "Extended Care",
                      price: "\$40.00",
                    ),
                    SizedBox(height: 8.h),
                    customTitleTile1(
                      title: "Additional Pet Rate",
                      price: "\$10.00",
                    ),
                    SizedBox(height: 8.h),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    customTitleTile1(
                      title: "Total",
                      price: "\$110.00",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              /// Apply Filters button
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  decoration: BoxDecoration(
                    color: AppColors.mainAppColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "Book Now",
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.041),
            ],
          ),
        ),
      ),
    );
  }


  /// Date Field
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
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: date != null ? Color(0xFF1F1D1D) : Color(0xFF757575),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
        ),
      ],
    );
  }

  /// Time Field
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
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: time != null ? Color(0xFF1F1D1D) : Color(0xFF757575),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
        ),
      ],
    );
  }

  /// Reusable Title Text
  Widget customTitleTile({required String title}) {
    return Text(
      title,
      style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w400),
    );
  }

  /// Reusable Title Text
  Widget customTitleTile1({required String title, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w400),
        ),

        Text(
          price,
          style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w400,color: Color(0xFF585858)),
        ),

      ],
    );
  }
}

