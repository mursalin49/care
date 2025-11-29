import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Controller/services/pet_selection_controller.dart';
import '../../../../../utils/app_colors.dart';



class PetSelectionBottomSheet extends StatelessWidget {
  final PetSelectionController controller;
  const PetSelectionBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "Select Your Pet",
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          Obx(() => Column(
            children: List.generate(
              controller.pets.length,
                  (index) {
                final pet = controller.pets[index];
                final isSelected =
                    controller.selectedPetIndex.value == index;
                return GestureDetector(
                  onTap: () => controller.selectPet(index),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.mainAppColor
                            : Color(0xFFE5E5E5),
                        width: 1,
                      ),
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
                        Column(
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
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
          SizedBox(height: 16.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainAppColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: Size(double.infinity, 48.h),
            ),
            onPressed: () {
              controller.confirmSelection(); // add new pet to list
              Get.back(); // close sheet
            },
            child: Text(
              "Confirm",
              style: TextStyle(
                fontFamily: 'Montserrat-Regular',
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
