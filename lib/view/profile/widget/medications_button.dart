import 'package:flutter/material.dart';
import 'package:petcare/utils/app_colors.dart';

class MedicationsButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const MedicationsButton({
    Key? key,
    required this.label,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = selected ? AppColors.mainAppColor : Colors.grey.shade300;
    final bg =  Colors.white;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? AppColors.mainAppColor : Color(0xFF585858),
            ),
          ),
        ),
      ),
    );
  }
}
