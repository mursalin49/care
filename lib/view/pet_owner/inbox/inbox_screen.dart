import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/view/pet_owner/inbox/chat_screen.dart';
import 'package:petcare/view/pet_owner/inbox/widgets/search_field.dart';
import '../../../../utils/app_colors.dart';
import '../../../helpers/route.dart';


class ChatListItem {
  final String id;
  final String userName;
  final String userImage;
  final String lastMessage;
  final String time;
  final bool isOnline;
  final int unreadCount;

  ChatListItem({
    required this.id,
    required this.userName,
    required this.userImage,
    required this.lastMessage,
    required this.time,
    required this.isOnline,
    this.unreadCount = 0,
  });
}

class ChatListController extends GetxController {
  final RxList<ChatListItem> chatList = <ChatListItem>[
    ChatListItem(
      id: '1',
      userName: 'Stephen Yustiono',
      userImage: 'assets/images/mursalin.jpg',
      lastMessage: 'Nice. I don\'t know why I ...',
      time: '9:36 AM',
      isOnline: true,
      unreadCount: 0,
    ),
    ChatListItem(
      id: '2',
      userName: 'Stephen Yustiono',
      userImage: 'assets/images/mursalin.jpg',
      lastMessage: 'Nice. I don\'t know why I ...',
      time: '9:36 AM',
      isOnline: false,
      unreadCount: 2,
    ),
    ChatListItem(
      id: '3',
      userName: 'Stephen Yustiono',
      userImage: 'assets/images/mursalin.jpg',
      lastMessage: 'Nice. I don\'t know why I ...',
      time: '9:36 AM',
      isOnline: false,
      unreadCount: 0,
    ),
    ChatListItem(
      id: '4',
      userName: 'Stephen Yustiono',
      userImage: 'assets/images/mursalin.jpg',
      lastMessage: 'Nice. I don\'t know why I ...',
      time: '9:36 AM',
      isOnline: false,
      unreadCount: 1,
    ),
    ChatListItem(
      id: '5',
      userName: 'Stephen Yustiono',
      userImage: 'assets/images/mursalin.jpg',
      lastMessage: 'Nice. I don\'t know why I ...',
      time: '9:36 AM',
      isOnline: false,
      unreadCount: 0,
    ),
  ].obs;

  final searchController = TextEditingController();
  final RxString searchQuery = ''.obs;

  void updateSearch(String query) {
    searchQuery.value = query;
  }

  List<ChatListItem> getFilteredChats() {
    if (searchQuery.isEmpty) {
      return chatList;
    }
    return chatList
        .where((chat) =>
        chat.userName.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }
}

class InboxScreen extends StatefulWidget {
  final String? userImage;
  final String? userName;

  const InboxScreen({
    super.key,
    this.userImage,
    this.userName,
  });

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  late ChatListController controller;
  final TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    controller = Get.put(ChatListController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: Obx(
                  () {
                final filteredChats = controller.getFilteredChats();
                if (filteredChats.isEmpty) {
                  return Center(
                    child: Text(
                      'No chats found',
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: filteredChats.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Colors.grey.shade200,
                    indent: 70.w,
                  ),
                  itemBuilder: (context, index) {
                    return _buildChatListTile(filteredChats[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// AppBar Container
  Container _buildAppBar() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.mainAppColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.h, right: 20.w, top: 24.h, bottom: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundImage: AssetImage('assets/images/profileImg.png'),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        "Chat",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.notificationScreen);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/NotificationICon.svg",
                        width: 22.w,
                        height: 22.h,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SearchField(
                  controller: searchController,
                  onChanged: (value) {
                    // Empty for now, will implement later
                  },
                  hintText: 'Search here...',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatListTile(ChatListItem chat) {
    return InkWell(
      onTap: () {
        Get.to(() => ChatScreen(
          contactName: chat.userName,
          contactImage: chat.userImage,

        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Online indicator dot
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: chat.isOnline
                      ? const Color(0xFF4CAF50)
                      : Colors.transparent,
                ),
              ),
            ),
            // Avatar
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: Image.asset(
                    chat.userImage,
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.w),
            // Chat info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.userName,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    chat.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            // Time
            Text(
              chat.time,
              style: GoogleFonts.montserrat(
                fontSize: 11.sp,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.searchController.dispose();
    super.dispose();
  }
}