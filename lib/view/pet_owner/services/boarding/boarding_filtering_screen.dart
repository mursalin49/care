import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_date_picker_sheet.dart';
import '../../../components/custom_time_picker_sheet.dart';
import 'boarding_sitters_screen.dart';



class BoardingFilteringScreen extends StatefulWidget{
  const BoardingFilteringScreen({super.key});

  @override
  State<BoardingFilteringScreen> createState() => _BoardingFilteringScreenState();
}

class _BoardingFilteringScreenState extends State<BoardingFilteringScreen> {
  String? selectedBoarding;
  String? selectedPet;
  final selectedOptions = <String>{};

  final List<String> boardingOptions = [
    "In the Sitter's home",
    "In the Sitter's resthouse",
    "In the Sitter's garden",
    "In the Sitter's farming house",
  ];

  final List<String> myPetList = [
    "Max",
    "Rock",
    "Bob",
    "Tiger",
    "Billu"
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

  void toggleOption(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
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
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
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
                          fontSize: 18.sp,
                          color: Color(0xFF101010),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Looking for",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Color(0xFF101010),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.h),


                      /// Boarding dropdrown section
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
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
                        child: Row(
                          children: [
                           SvgPicture.asset("assets/icons/homeIcon.svg"),
                            SizedBox(width: 10),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(12.r),
                                  dropdownColor: AppColors.white,
                                  isExpanded: true,
                                  hint: Text(
                                    "Select a boarding",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat-Regular',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                              
                                  value: selectedBoarding,
                                  icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF757575), size: 30,),
                                  items: boardingOptions.map((String member) {
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
                                      selectedBoarding = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),

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
                    ],
                  ),

                ),
                SizedBox(height: 18.h),

                /// -------------------------- Pet Section ---------------------------------- ///
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
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
                        "Pet",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 18.sp,
                          color: Color(0xFF101010),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Your Pets",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Color(0xFF101010),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
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
                        child:  Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(12.r),
                              dropdownColor: AppColors.white,
                              isExpanded: true,
                              hint: Text(
                                "Select a Pet",
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Regular',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade600,
                                ),
                              ),

                              value: selectedPet,
                              icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF757575), size: 30,),
                              items: myPetList.map((String member) {
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
                                  selectedPet = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Select at least one pet to ensure a more accurate search",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),

                /// ------------------------------------ Filters & choice option section ------------------------ ///

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
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
                        "Filters",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 18.sp,
                          color: Color(0xFF101010),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      _buildSection("Daytime availability", [
                        "Sitter is home full-time",
                        "Sitter works from home",
                      ]),
                      _buildSection("Home features", [
                        "Has fenced garden",
                        "Pets allowed on furniture",
                        "No smoking home",
                        "All types",
                      ]),
                      _buildSection("Pets in the home", [
                        "Doesn't own dogs",
                        "Doesn't own cats",
                        "Accepts only one booking at a time",
                        "Does not own caged pets",
                      ]),
                      _buildSection("Children in the home", [
                        "Has no children",
                        "Has no children 0–5 years old",
                        "Has no children 6–12 years old",
                      ]),
                      _buildSection("Others", [
                        "Accepts non spayed female dogs",
                        "Accepts non neutered male dogs",
                        "Bathing/Grooming",
                        "Dog first-aid / CPR",
                      ]),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.031),

                /// Apply Filters button
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
                      "Apply filters",
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


  ///  Filters & choice option section

  Widget _buildSection(String title, List<String> options) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Montserrat-SemiBold',
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.h),
          ...options.map((option) => GestureDetector(
            onTap: () => toggleOption(option),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      option,
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedOptions.contains(option)
                            ? AppColors.mainAppColor
                            : Colors.grey.shade400,
                        width: 2,
                      ),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedOptions.contains(option)
                              ? AppColors.mainAppColor
                              : Colors.transparent, // unselected = hollow
                          border: Border.all(
                            color: selectedOptions.contains(option)
                                ? AppColors.mainAppColor
                                : Colors.grey.shade400,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}