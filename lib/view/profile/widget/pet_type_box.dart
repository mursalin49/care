import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petcare/utils/app_colors.dart';

class PetTypeBox extends StatelessWidget {
  final String label;
  final Widget icon;
  final bool selected;
  final VoidCallback onTap;

  const PetTypeBox({
    Key? key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = selected ? AppColors.mainAppColor : Colors.grey.shade300;
    final bg = Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 40.w,
              height: 40.h,
              child: icon,
            ),
            const SizedBox(height: 8),
            Text(label, style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
