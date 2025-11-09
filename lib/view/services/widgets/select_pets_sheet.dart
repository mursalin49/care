import 'package:flutter/material.dart';

class SelectPetsSheet extends StatelessWidget{
  const SelectPetsSheet({super.key});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),
    );
  }

}