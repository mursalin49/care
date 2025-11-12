import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/view/components/custom_app_bar.dart';
import 'package:petcare/view/services/dog%20walking/dog_walking_sitters_screen.dart';
import 'package:petcare/view/services/doggy%20day%20care/day_care_sitters_screen.dart';
import 'package:petcare/view/services/doggy%20day%20care/widget/pet_selection_bottom_sheet.dart';
import '../../../Controller/services/daycare_schedule_controller.dart';
import '../../../Controller/services/pet_selection_controller.dart';
import '../../../utils/app_colors.dart';
import '../../components/custom_date_picker_sheet.dart';
import '../../components/custom_time_picker_sheet.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';


class DogWalkingScreen extends StatefulWidget{
  const DogWalkingScreen({super.key});

  @override
  State<DogWalkingScreen> createState() => _DogWalkingScreenState();
}

class _DogWalkingScreenState extends State<DogWalkingScreen> {

  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  final DaycareScheduleController controller = Get.put(DaycareScheduleController());
  final petController = Get.put(PetSelectionController());

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
        title: "Dog Walking",
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.031),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "When do you need a sitter?",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 18.sp,
                      color: Color(0xFF111111),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 15.sp,
                        color: Color(0xFF111111),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Text(
                "Schedule",
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 16.sp,
                  color: Color(0xFF101010),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),

              /// ✅ Schedule selection buttons with GetX
              Obx(() {
                final type = controller.selectedType.value;
                return Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.toggleType('oneTime'),
                        child: Container(
                          height: 104.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: type == 'oneTime'
                                  ? AppColors.mainAppColor
                                  : const Color(0xFFE5E5E5),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.10),
                                offset: const Offset(0, 2),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/boardingIcon.svg"),
                                SizedBox(height: 16.h),
                                Text(
                                  "One Time",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 15.sp,
                                    color: Color(0xFF101010),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.toggleType('repeatWeekly'),
                        child: Container(
                          height: 104.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: type == 'repeatWeekly'
                                  ? AppColors.mainAppColor
                                  : const Color(0xFFE5E5E5),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.10),
                                offset: const Offset(0, 2),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/boardingIcon.svg"),
                                SizedBox(height: 16.h),
                                Text(
                                  "Repeat Weekly",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 15.sp,
                                    color: Color(0xFF101010),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),

              SizedBox(height: 24.h),

              /// ✅ Days of week (only for repeat weekly)
              Obx(() {
                if (controller.selectedType.value == 'repeatWeekly') {
                  final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Days of the week",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 15.sp,
                          color: Color(0xFF101010),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(days.length, (index) {
                          final isActive = controller.selectedDays.contains(index);

                          return GestureDetector(
                            onTap: () => controller.toggleDay(index),
                            child: Container(
                              width: 36.r,
                              height: 36.r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isActive ? AppColors.mainAppColor : Colors.white,
                                border: Border.all(
                                  color: isActive ? Colors.transparent : Color(0xFFE5E5E5),
                                  width: 1.5,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  days[index],
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 14.sp,
                                    color: isActive ? Colors.white : Color(0xFF585858),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 24.h),
                    ],
                  );
                }
                return const SizedBox();
              }),

              /// Common date & time picker section
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
                            date: endDate,
                            placeholder: "Select end date",
                            onTap: () async {
                              final DateTime? picked =
                              await showCustomDatePickerSheet(
                                context,
                                initialDate: endDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                              );
                              if (picked != null && picked != endDate) {
                                setState(() {
                                  endDate = picked;
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
              SizedBox(height: 10.h),

              /// Controller for OneTime or Repeat weekly
              Obx(() {
                if (controller.selectedType.value == 'repeatWeekly'){
                  return Text(
                    "Add dates and an address to see sitters who’ll be available for your need.",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 11.sp,
                      color: Color(0xFF585858),
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }
                return const SizedBox();
              }),

              /// pet selection button
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    PetSelectionBottomSheet(controller: petController),
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                  );
                },
                child: DottedBorder(
                  color: AppColors.mainAppColor,
                  strokeWidth: 1.5,
                  dashPattern: const [7, 3],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        vertical: 12.h, horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,
                            color: AppColors.mainAppColor, size: 20),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.030),

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
              SizedBox(height: MediaQuery.of(context).size.height * 0.030),

              ///Next button
              GestureDetector(
                onTap: () {
                  Get.to(() => const DogWalkingSittersScreen());
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
    );
  }

  /// Reusable Date Field
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

  /// Reusable time Field
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