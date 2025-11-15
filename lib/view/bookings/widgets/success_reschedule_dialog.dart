import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showRescheduleSuccessDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user can't tap outside to close
    barrierColor: Colors.black.withOpacity(0.5), // grey overlay
    builder: (context) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Close button (top-right)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, size: 24),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                /// Circle check icon
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF1BA975), // green
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.check,
                    color: Color(0xFF1BA975),
                    size: 32,
                  ),
                ),

                SizedBox(height: 18.h),

                /// Message text
                Text(
                  "Your reschedule has been \nsuccessfully confirmed.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF111111),
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
