import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:petcare/view/components/custom_app_bar.dart';
import 'package:petcare/view/services/boarding/widget/custom_calendar.dart';


class SitterProfileDetailsScreen extends StatefulWidget{
  const SitterProfileDetailsScreen({super.key});

  @override
  State<SitterProfileDetailsScreen> createState() => _SitterProfileDetailsScreenState();
}

class _SitterProfileDetailsScreenState extends State<SitterProfileDetailsScreen> {
  String? selectedOptions;

  final List<String> options = [
    "Boarding",
    "Doggy Day Care",
    "Dog Walking"
  ];

  final List<String> filters = [
    "Top Rated",
    "Quick Responder",
    "Experienced",
    "Background Check",
  ];

  final Set<String> selectedFilters = {"Background Check"};

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Sitter Profile",
          showBackButton: true,
        ),
        body: Column(
          children: [
            // Header Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.031),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage: AssetImage("assets/images/profileImg.png"),
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Seam Rahman",
                            style: TextStyle(
                              fontFamily: 'Montserrat-Regular',
                              fontSize: 18.sp,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/locationIcon.svg", color: AppColors.mainAppColor,  width: 18, height: 18),
                              SizedBox(width: 4.w),
                              Text(
                                "New York",
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Regular',
                                  fontSize: 12.sp,
                                  color: Color(0xFF585858),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/reviewIcon.svg", width: 18, height: 18),
                              SizedBox(width: 4.w),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF585858),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '4.5',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const TextSpan(text: ' (42 reviews)'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: filters.map((filter) {
                      final bool isSelected = selectedFilters.contains(filter);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedFilters.remove(filter);
                            } else {
                              selectedFilters.add(filter);
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.green.withOpacity(0.05)
                                : Colors.white,
                            border: Border.all(
                              color: isSelected
                                  ? Colors.green
                                  : Colors.grey.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isSelected)
                                Icon(Icons.check_circle,
                                    color: Colors.green, size: 18.sp),
                              if (isSelected) SizedBox(width: 6.w),
                              Text(
                                filter,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 18.h),
                ],
              ),
            ),

            // Tab Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TabBar(
                //isScrollable: true,
                indicatorColor: AppColors.mainAppColor,
                labelStyle: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF585858),
                ),
                labelColor: AppColors.mainAppColor,
                unselectedLabelColor: Color(0xFF585858),
                tabs: [
                  Tab(child: Text("About")),
                  Tab(child: Text("Services")),
                  Tab(child: Text("Reviews")),
                  Tab(child: Text("Portfolio")),
                ],
              ),
            ),

            // Tab Content
            Expanded(
              child: TabBarView(
                children: [
                  // About Tab
                  _buildAboutTab(),

                  // Services Tab
                  _buildServicesTab(),

                  // Reviews Tab
                  _buildReviewsTab(),

                  // Portfolio Tab
                  _buildPortfolioTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // About Tab Content
  Widget _buildAboutTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Seam Rahman",
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontSize: 18.sp,
              color: Color(0xFF000000),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "Animal lover with 5+ years of professional pet care experience. I provide personalized care for your furry friends with attention to their unique needs and preferences.",
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontSize: 14.sp,
              color: Color(0xFF4B5563),
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          SizedBox(height: 15.h),

          // Skill List
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFE3E6F0)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withOpacity(0.20),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Skills",
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12.h),
                _buildFeatureItem("5 Years of experience"),
                _buildFeatureItem("Grooming & Bathing"),
                _buildFeatureItem("Basic Training"),
                _buildFeatureItem("Senior Pet Care"),
              ],
            ),
          ),
          SizedBox(height: 15.h),

          // Home details Info
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFE3E6F0)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withOpacity(0.20),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home Details",
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12.h),
                _buildHomedetailsItem('Lives in apartment', 'assets/icons/homeIcon.svg'),
                _buildHomedetailsItem('Dose not have a yard', 'assets/icons/notAllowIcon.svg'),
                _buildHomedetailsItem('Non-smoking household', 'assets/icons/notAllowIcon.svg'),
                _buildHomedetailsItem('No children present', 'assets/icons/notAllowIcon.svg'),
                _buildHomedetailsItem('Has no pets', 'assets/icons/dogIcon.svg'),
                _buildHomedetailsItem('Dog allowed on bed', 'assets/icons/bedIcon.svg'),
                _buildHomedetailsItem('Dog allowed on furniture', 'assets/icons/chairIcon.svg'),
                _buildHomedetailsItem('Takes only 1 client at a time', 'assets/icons/restictionIcon.svg'),
                _buildHomedetailsItem('Potty breaks every 2-4 hours', 'assets/icons/timerIcon.svg'),
            ],
            ),
          ),
          SizedBox(height: 16.h),

          // Live location Info
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFE3E6F0)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withOpacity(0.20),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "New York, USA",
                  style: TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 11.sp,
                    color: Color(0xFF585858),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 14.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Image.asset("assets/images/mapPlaceholderImg.png"),
                  ),
                ),
              ],
            )
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.031),
        ],
      ),
    );
  }

  // Services Tab Content
  Widget _buildServicesTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icons/boardingIcon.svg"),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Boarding",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 16.sp,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "In the siter’s home",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 12.sp,
                          color: Color(0xFF585858),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$99",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 16.sp,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Per night",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 12.sp,
                      color: Color(0xFF585858),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 18.h),
          _buildServicePrices(
            title: "Holiday Rate",
            price: "\$110",
            description: "Per night",
          ),

          SizedBox(height: 18.h),
          _buildServicePrices(
            title: "Puppy Rate",
            price: "\$48",
            description: "Per night",
          ),

          SizedBox(height: 18.h),
          _buildServicePrices(
            title: "Cat Care",
            price: "\$48",
            description: "Per night",
          ),
          SizedBox(height: 18.h),
          _buildServicePrices(
            title: "Additional Cat",
            price: "\$48",
            description: "Per night",
          ),
          SizedBox(height: 18.h),
          _buildServicePrices(
            title: "Stays of 8 Nights or more",
            price: "\$48",
            description: "Per night",
          ),
          SizedBox(height: 18.h),
          _buildServicePrices(
            title: "Bathing/ Grooming",
            price: "\$48",
            description: "Per each",
          ),
          SizedBox(height: 18.h),
          _buildServicePrices(
            title: "Sitter Pick-Up and Drop-Off",
            price: "\$48",
            description: "Per night",
          ),
          SizedBox(height: 18.h),
          _buildServicePrices(
            title: "Extended Care",
            price: "\$48",
            description: "Per night",
          ),
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icons/dogWalkIcon.svg"),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dog Walking",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 16.sp,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "In your neighbourhood",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 12.sp,
                          color: Color(0xFF585858),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$99",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 16.sp,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Per night",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 12.sp,
                      color: Color(0xFF585858),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 18.h),
          _buildServicePrices(
            title: "60 minute rate",
            price: "\$15",
            description: "Per dog",
          ),
          SizedBox(height: 18.h),
          _buildServicePrices(
            title: "Holiday rate",
            price: "\$30",
            description: "Per dog",
          ),
          SizedBox(height: 18.h),
          _buildServicePrices(
            title: "Puppy Rate",
            price: "\$48",
            description: "Per dog",
          ),
          SizedBox(height: 24.h),
          Text(
            "Calendar",
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontSize: 16.sp,
              color: Color(0xFF111111),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 14.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFF9ABFC8), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withOpacity(0.20),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                )
              ],
            ),
            child:  Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(12.r),
                  dropdownColor: AppColors.white,
                  isExpanded: true,
                  hint: Text(
                    "Select a Pet",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),

                  value: selectedOptions,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF757575), size: 30,),
                  items: options.map((String member) {
                    return DropdownMenuItem<String>(
                      value: member,
                      child: Text(
                        member,
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOptions = newValue!;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          CustomCalendarWidget(
            unavailableDays: [
              DateTime(2025, 11, 12),
              DateTime(2025, 11, 13),
              DateTime(2025, 11, 14),
            ],
            onDaySelected: (selectedDay) {
              debugPrint('Selected: $selectedDay');
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.030),
          GestureDetector(
            onTap: (){
             // Get.to(() => const BoardingSittersScreen());
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.mainAppColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                "Book Service",
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.050),
        ],
      ),
    );

  }

  // Reviews Tab Content
  Widget _buildReviewsTab() {
    final List<Map<String, dynamic>> reviews = [
      {
        'name': 'Sarah Johnson',
        'rating': 5,
        'date': '2 weeks ago',
        'comment': 'Seam was absolutely wonderful with our golden retriever! Very professional and caring.',
        'avatar': 'assets/images/profileImg.png'
      },
      {
        'name': 'Mike Chen',
        'rating': 4,
        'date': '1 month ago',
        'comment': 'Great service, our cat loved having Seam around. Will definitely book again!',
        'avatar': 'assets/images/profileImg.png'
      },
      {
        'name': 'Emily Rodriguez',
        'rating': 5,
        'date': '2 months ago',
        'comment': 'Reliable and trustworthy. Our pets were happy and well cared for.',
        'avatar': 'assets/images/profileImg.png'
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.all(20.w),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: AssetImage(review['avatar']),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review['name'],
                          style: TextStyle(
                            fontFamily: 'Montserrat-Regular',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            _buildStarRating(review['rating']),
                            SizedBox(width: 8.w),
                            Text(
                              review['date'],
                              style: TextStyle(
                                fontFamily: 'Montserrat-Regular',
                                fontSize: 12.sp,
                                color: Color(0xFF585858),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                review['comment'],
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 14.sp,
                  color: Color(0xFF585858),
                  height: 1.4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Portfolio Tab Content - SINGLE COLUMN LIST
  Widget _buildPortfolioTab() {
    // Mock portfolio images - replace with actual images
    List<String> portfolioImages = [
      'assets/images/portfolioImg.png',
      'assets/images/portfolioImg.png',
      'assets/images/portfolioImg.png',
      'assets/images/portfolioImg.png',
      'assets/images/portfolioImg.png',
      'assets/images/portfolioImg.png',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Text(
            "Portfolio",
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: portfolioImages.length,
              itemBuilder: (context, index) {
                return _buildPortfolioItem(portfolioImages[index], index);
              },
            ),
          ),
        )
      ],
    );
  }

  // Helper method for skills items
  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/doneIcon.svg"),
          SizedBox(width: 12.w),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontSize: 14.sp,
              color: Color(0xFF101010),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // helper method for home details items
  Widget _buildHomedetailsItem(String text, String iconPath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20.w,
            height: 20.h,
            color: AppColors.mainAppColor,
          ),
          SizedBox(width: 12.w),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontSize: 14.sp,
              color: const Color(0xFF101010),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // helper method for service prices
  Widget _buildServicePrices({ required String title, required String price, required String description}){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Montserrat-Regular',
              fontSize: 16.sp,
              color: const Color(0xFF585858),
              fontWeight: FontWeight.w500,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 12.sp,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 12.sp,
                  color: const Color(0xFF7A7A7A),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  // Helper method for star rating
  Widget _buildStarRating(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 16.sp,
        );
      }),
    );
  }


  // Helper method for Portfolio Item Widget - FIXED HEIGHT
  Widget _buildPortfolioItem(String imagePath, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xFFE3E6F0)),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          width: double.infinity,
          height: 200.h, // Fixed height for consistent sizing
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade300,
                child: Icon(
                  Icons.pets,
                  size: 40.sp,
                  color: Colors.grey.shade500,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}