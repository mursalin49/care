import 'package:flutter/material.dart';

class CustomToggleChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CustomToggleChip({
    Key? key,
    required this.label,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = selected ? Theme.of(context).primaryColor : Colors.grey.shade300;
    final bg = selected ? Theme.of(context).primaryColor.withOpacity(0.08) : Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1.3),
        ),
        child: Text(label),
      ),
    );
  }
}
