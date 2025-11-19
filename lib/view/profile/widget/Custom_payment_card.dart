import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/utils/app_colors.dart';


class CustomPaymentCard extends StatelessWidget {

  final String date;
  final String title;
  final String price;
  final String cardLastDigit;
  final String tipsPrice;
  final String status;

  const CustomPaymentCard({
    super.key,
    required this.price,
    required this.status,
    required this.date,
    required this.title,
    required this.tipsPrice,
    required this.cardLastDigit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Color(0xFFE3E6F0),
          width: 0.6,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            offset: const Offset(0, 2),
            blurRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainAppColor,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: Colors.black
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          Text(
            title,
            style: TextStyle(
                fontFamily: 'Montserrat-Regular',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: Colors.black
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            date,
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Tip: $tipsPrice",
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontWeight: FontWeight.w400,
              color: Color(0xFF585858),
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "American Express $cardLastDigit: $price",
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontWeight: FontWeight.w400,
              color: Color(0xFF585858),
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "American Express $cardLastDigit: $tipsPrice",
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontWeight: FontWeight.w400,
              color: Color(0xFF585858),
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              status,
              style: TextStyle(
                fontFamily: 'Montserrat-Regular',
                fontWeight: FontWeight.w500,
                color: status == "Complete"
                    ? Colors.green
                    : AppColors.mainAppColor,
                fontSize: 14.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
