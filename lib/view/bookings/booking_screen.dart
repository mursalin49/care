import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/view/components/custom_app_bar.dart';
import '../../utils/app_colors.dart';

class BookingsScreen extends StatefulWidget{
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Order history", showBackButton: false),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.only(left: 20),
          )
        ],
      ),
    );
  }
}

