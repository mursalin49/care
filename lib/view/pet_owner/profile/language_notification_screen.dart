import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import '../../../Controller/profile/language_controller.dart';
import '../../components/custom_app_bar.dart';



class LanguageAndNotificationScreen extends StatelessWidget{
   LanguageAndNotificationScreen({super.key});

   final _controllerAll = ValueNotifier<bool>(false);
   final _controllerBooking = ValueNotifier<bool>(false);
   final _controllerReminder = ValueNotifier<bool>(false);

   final LanguageController c = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: "Language & Notifications"),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFE5E5E5)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.080),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  )
                ],
              ),
              child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTitleTile(title: "Language", fontSize: 17.sp),
                  SizedBox(height: 18.h),
                  settingsTile(
                    title: "English",
                    selected: c.selectedLang.value == "English",
                    onTap: () => c.selectLanguage("English"),
                  ),
                  SizedBox(height: 18.h),
                  settingsTile(
                    title: "Spanish",
                    selected: c.selectedLang.value == "Spanish",
                    onTap: () => c.selectLanguage("Spanish"),
                  ),
                ],
              )),
            ),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFE5E5E5)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.080),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTitleTile(title: "Notifications", fontSize: 17.sp),
                  SizedBox(height: 18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTitleTile(title: "All"),
                      AdvancedSwitch(
                        activeColor: AppColors.mainAppColor,
                        inactiveColor: Color(0xFF787880).withOpacity(0.16),
                        width: 48.w,
                        height: 25.h,
                        controller: _controllerAll,
                        borderRadius: BorderRadius.circular(77),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTitleTile(title: "Booking"),
                      AdvancedSwitch(
                        activeColor: AppColors.mainAppColor,
                        inactiveColor: Color(0xFF787880).withOpacity(0.16),
                        width: 48.w,
                        height: 25.h,
                        controller: _controllerBooking,
                        borderRadius: BorderRadius.circular(77),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTitleTile(title: "Reminder"),
                      AdvancedSwitch(
                        activeColor: AppColors.mainAppColor,
                        inactiveColor: Color(0xFF787880).withOpacity(0.16),
                        width: 48.w,
                        height: 25.h,
                        controller: _controllerReminder,
                        borderRadius: BorderRadius.circular(77),
                      ),
                    ],
                  ),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
  /// Reusable Title Text
  Widget customTitleTile({
    required String title,
    double? fontSize, // optional
  }) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Montserrat-Regular',
        fontSize: fontSize ?? 14.sp,
        fontWeight: FontWeight.w500,
        color: Color(0xFF101010),
      ),
    );
  }


   /// Language / Settings Tile
   Widget settingsTile({
     required String title,
     required bool selected,
     required VoidCallback onTap,
   }) {
     return GestureDetector(
       onTap: onTap,
       child: Container(
         width: double.infinity,
         padding: const EdgeInsets.all(14.0),
         decoration: BoxDecoration(
           color: selected ? AppColors.mainAppColor : Colors.white,
           borderRadius: BorderRadius.circular(12),
           border: Border.all(color: Color(0xFFE5E5E5)),
           boxShadow: [
             BoxShadow(
               color: const Color(0xFF000000).withOpacity(0.080),
               offset: const Offset(0, 2),
               blurRadius: 4,
             )
           ],
         ),
         child: Center(
           child: Text(
             title,
             style: TextStyle(
               fontSize: 16.sp,
               fontWeight: FontWeight.w500,
               color: selected ? Colors.white : Color(0xFF1F1D1D),
             ),
           ),
         ),
       ),
     );
   }

}