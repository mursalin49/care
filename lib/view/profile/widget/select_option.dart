import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/utils/app_colors.dart';

class SelectOption extends StatelessWidget {
  final String label;
  final RxString selectedValue;
  final String value;

  const SelectOption({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = selectedValue.value == value;

      return GestureDetector(
        onTap: () => selectedValue.value = value,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? AppColors.mainAppColor : Colors.grey.shade300,
              width: 2,
            ),
            color: Colors.white,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.mainAppColor : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      );
    });
  }
}
