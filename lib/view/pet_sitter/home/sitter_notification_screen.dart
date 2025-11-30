import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors.dart';


class SitterNotificationScreen extends StatelessWidget {
  const SitterNotificationScreen({super.key});

  // Sample data to populate the list
  final List<Map<String, dynamic>> notifications = const [
    {
      'name': 'Tamim',
      'message': 'Hey, I loved your recent works about The Serves ..',
      'time': '1 day ago',
    },
    {
      'name': 'Sarah Chen',
      'message': 'Hey, I loved your recent works about The Serves ..',
      'time': '2 days ago',
    },
    {
      'name': 'Tamim',
      'message': 'Hey, I loved your recent works about The Serves ..',
      'time': '1 day ago',
    },
    {
      'name': 'Sarah Chen',
      'message': 'Hey, I loved your recent works about The Serves ..',
      'time': '4 days ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Notification',
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,


        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(

            bottomLeft: Radius.circular(30.r),

            bottomRight: Radius.circular(30.r),
          ),
        ),

      ),
      backgroundColor: AppColors.bgColor,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return _NotificationCard(
            name: notification['name'] as String,
            message: notification['message'] as String,
            time: notification['time'] as String,
          );
        },
      ),
    );
  }
}

// Reusable widget for an individual notification card
class _NotificationCard extends StatelessWidget {
  final String name;
  final String message;
  final String time;

  const _NotificationCard({
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: AppColors.white,
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ICON
              SvgPicture.asset(
                'assets/icons/notti.svg',
                width: 28.sp,
                height: 28.sp,
              ),

              SizedBox(width: 10),

              // TEXTS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New message from $name',
                      style: const TextStyle(
                        color: AppColors.mainAppColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),

                    Text(
                      message,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 4),

                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // MORE BUTTON
              IconButton(
                onPressed: () {
                  _showDeleteDialog(context);
                },
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------- Delete Confirmation Dialog --------------------
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset("assets/icons/deleteIcon.svg"),
              ),
              SizedBox(height: 12.h),
              Text(
                "Delete Notification",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF202020),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Are you sure to delete this notification?",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF494949),
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: 'Prompt_regular',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        elevation: 0,
                      ),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontFamily: 'Prompt_regular',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
