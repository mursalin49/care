import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:petcare/view/pet_owner/profile/widget/Custom_payment_card.dart';
import '../../components/custom_app_bar.dart';
import 'card_details_screen.dart';

class PaymentsScreen extends StatelessWidget{
  const PaymentsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        title: "Payments",
        showBackButton: true,
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.055),

                /// Payment button
                GestureDetector(
                  onTap: () {
                    Get.to(() => CardDetailsScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.mainAppColor),
                    ),
                    child: Text(
                      "Add or Modify a payment Method",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainAppColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.035),

                /// Payment History
                Text(
                  "Payment History",
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Color(0xFF111111),
                  ),
                ),

                SizedBox(height: 10.h),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomPaymentCard(
                      price: "400.00",
                      status: index % 2 == 0 ? "Complete" : "Pending",
                      date: "03/20/2024-03/25/2024",
                      title: "Chabela's stay with Joye E. from",
                      tipsPrice: "45.00",
                      cardLastDigit: "XXXX-1002",
                    );
                  },
                ),
              ],
            ),
          ),
        )

    );
  }

}