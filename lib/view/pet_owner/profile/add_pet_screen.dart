import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:petcare/view/pet_owner/profile/widget/gender_button.dart';
import 'package:petcare/view/pet_owner/profile/widget/medications_button.dart';
import 'package:petcare/view/pet_owner/profile/widget/pet_type_box.dart';
import 'package:petcare/view/pet_owner/profile/widget/select_option.dart';
import '../../../Controller/profile/pet_controller.dart';
import '../../components/custom_app_bar.dart';
import '../../components/custom_text_field.dart';




class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {

  /// Text controllers for inputs (local)
  final _nameCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _ageYearCtrl = TextEditingController();
  final _ageMonthCtrl = TextEditingController();
  final _dobCtrl = TextEditingController();
  final _breedCtrl = TextEditingController();
  final _adoptionCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final _pillCtrl = TextEditingController();
  final _everythingKnowCtrl = TextEditingController();
  final _veterinaryCtrl = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  /// GetX controller
  final PetController c = Get.find();

  @override
  void initState() {
    super.initState();
    /// default values if controller empty
    if (c.petType.value.isEmpty) c.petType.value = 'Dog';
    if (c.gender.value.isEmpty) c.gender.value = 'Male';
    if (c.medications.value.isNotEmpty) c.medications.value = 'Pill';
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _weightCtrl.dispose();
    _ageYearCtrl.dispose();
    _ageMonthCtrl.dispose();
    _dobCtrl.dispose();
    _breedCtrl.dispose();
    _adoptionCtrl.dispose();
    descriptionCtrl.dispose();
    _pillCtrl.dispose();
    _everythingKnowCtrl.dispose();
    _veterinaryCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource src) async {
    final XFile? xfile = await _picker.pickImage(
      source: src,
      imageQuality: 80,
      maxWidth: 1200,
    );
    if (xfile == null) return;
    // set image path in controller (reactive)
    c.petImage.value = xfile.path;
  }

  /// Pic Up image option section
  Future<void> _showImageOptions() async {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Photo'),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickImage(ImageSource.gallery);
                },
              ),
              Obx(() {
                return (c.petImage.value != null &&
                        c.petImage.value!.isNotEmpty)
                    ? ListTile(
                        leading: const Icon(Icons.delete),
                        title: const Text('Remove Photo'),
                        onTap: () {
                          c.petImage.value = null;
                          Navigator.pop(ctx);
                        },
                      )
                    : const SizedBox.shrink();
              }),
            ],
          ),
        );
      },
    );
  }

  /// For pic Date of birth
  Future<void> _pickDob() async {
    final DateTime now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1990),
      lastDate: now,
    );
    if (picked != null) {
      final formatted = DateFormat('yyyy-MM-dd').format(picked);
      _dobCtrl.text = formatted;
    }
  }

  Future<void> _pickAdoptionDate() async {
    final DateTime now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1990),
      lastDate: now,
    );
    if (picked != null) {
      final formatted = DateFormat('yyyy-MM-dd').format(picked);
      _adoptionCtrl.text = formatted;
    }
  }



  /// -------------------------------------- For save all input data -----------------------------
  void _onSave() {
    if (_nameCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter pet name')));
      return;
    }

    /// copy text fields into controller strings
    c.name.value = _nameCtrl.text.trim();
    c.weight.value = _weightCtrl.text.trim();
    c.ageYear.value = _ageYearCtrl.text.trim();
    c.ageMonth.value = _ageMonthCtrl.text.trim();
    c.dob.value = _dobCtrl.text.trim();
    c.breed.value = _breedCtrl.text.trim();
    c.description.value = descriptionCtrl.text.trim();
    c.adopDate.value = _adoptionCtrl.text.trim();
    c.pillName.value = _pillCtrl.text.trim();
    c.everythingKnow.value = _everythingKnowCtrl.text.trim();
    c.veterinaryInfo.value = _veterinaryCtrl.text.trim();

    /// call controller.savePet() - it will build the map from controller
    c.savePet();

    /// get the added entry and return it as result
    final added = c.pets.isNotEmpty ? c.pets.last : null;

    /// clear form in controller already done inside savePet(); if you need local UI cleared, also clear controllers:
    _nameCtrl.clear();
    _weightCtrl.clear();
    _ageYearCtrl.clear();
    _ageMonthCtrl.clear();
    _dobCtrl.clear();
    _breedCtrl.clear();
    _adoptionCtrl.clear();
    descriptionCtrl.clear();
    _pillCtrl.clear();
    _everythingKnowCtrl.clear();
    _veterinaryCtrl.clear();

    Get.back(result: added);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Pet", showBackButton: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.043),

            /// Upload / preview image (reactive)
            GestureDetector(
              onTap: _showImageOptions,
              child: Obx(() {
                final imgPath = c.petImage.value;
                return Container(
                  height: 163.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.r),
                    image: (imgPath != null && imgPath.isNotEmpty)
                        ? DecorationImage(
                            image: FileImage(File(imgPath)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: (imgPath == null || imgPath.isEmpty)
                      ? Center(
                          child: GestureDetector(
                            onTap: _showImageOptions,
                            child: SvgPicture.asset(
                              "assets/images/uploadImg.svg",
                              color: AppColors.mainAppColor,
                            ),
                          ),
                        )
                      : Stack(
                          children: [
                            Positioned(
                              right: 10,
                              top: 10,
                              child: InkWell(
                                onTap: () => c.petImage.value = null,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(6),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                );
              }),
            ),
            SizedBox(height: 16.h),

            /// ---------------------------------- Pet Details ------------------------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFE3E6F0), width: 0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/icon.svg"),
                      SizedBox(width: 8.w),
                      customTitleTile(title: "Pet Details"),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Provide your sitter with a description of your pet",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF585858),
                    ),
                  ),
                  SizedBox(height: 14.h),

                  customTitleTile(title: "What type of pet?"),
                  SizedBox(height: 8.h),

                  /// Pet Type (Dog / Cat) - reactive
                  Obx(() {
                    return Row(
                      children: [
                        Expanded(
                          child: PetTypeBox(
                            label: 'Dogs',
                            icon: SvgPicture.asset("assets/icons/dogIcon.svg"),
                            selected: c.petType.value == 'Dog',
                            onTap: () => c.petType.value = 'Dog',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: PetTypeBox(
                            label: 'Cats',
                            icon: SvgPicture.asset("assets/icons/catIcon.svg"),
                            selected: c.petType.value == 'Cat',
                            onTap: () => c.petType.value = 'Cat',
                          ),
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: 14.h),

                  /// Name section
                  customTitleTile(title: "Name"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: _nameCtrl,
                    hintText: 'Pet Name',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF5E5E5E),
                    ),
                    fillColor: const Color(0xFFFFFFFF),
                    fieldBorderColor: AppColors.borderColor,
                  ),
                  SizedBox(height: 14.h),

                  /// weight section
                  customTitleTile(title: "Weight (lbs)"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: _weightCtrl,
                    hintText: 'Weight',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF5E5E5E),
                    ),
                    fillColor: const Color(0xFFFFFFFF),
                    fieldBorderColor: AppColors.borderColor,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 14.h),

                  /// Old section
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customTitleTile(title: "Age (Year)"),
                            SizedBox(height: 8.h),
                            CustomTextField(
                              textEditingController: _ageYearCtrl,
                              hintText: 'Age (Year)',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat-Regular',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: const Color(0xFF5E5E5E),
                              ),
                              fillColor: const Color(0xFFFFFFFF),
                              fieldBorderColor: AppColors.borderColor,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customTitleTile(title: "Age (Month)"),
                            SizedBox(height: 8.h),
                            CustomTextField(
                              textEditingController: _ageMonthCtrl,
                              hintText: 'Age (Month)',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat-Regular',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: const Color(0xFF5E5E5E),
                              ),
                              fillColor: const Color(0xFFFFFFFF),
                              fieldBorderColor: AppColors.borderColor,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),

                  /// Date of birth
                  customTitleTile(title: "Date of birth"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: _dobCtrl,
                    hintText: 'Date of birth',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF5E5E5E),
                    ),
                    readOnly: true,
                    onTap: _pickDob,
                  ),
                  SizedBox(height: 14.h),

                  /// Breed Dropdown
                  customTitleTile(title: "Breed"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: _breedCtrl,
                    hintText: 'Breed',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF5E5E5E),
                    ),
                  ),
                  SizedBox(height: 14.h),

                  /// Gender section
                  customTitleTile(title: "Gender"),
                  SizedBox(height: 8.h),
                  Obx(() {
                    return Row(
                      children: [
                        GenderButton(
                          label: 'Male',
                          selected: c.gender.value == 'Male',
                          onTap: () => c.gender.value = 'Male',
                        ),
                        const SizedBox(width: 10),
                        GenderButton(
                          label: 'Female',
                          selected: c.gender.value == 'Female',
                          onTap: () => c.gender.value = 'Female',
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: 24.h),

                  const Divider(thickness: 1, color: Color(0xFFEBEBEB)),
                  SizedBox(height: 15.h),

                  /// ------------------------------------- Additional Details ------------------------------- ///
                  Text(
                    "Additional details",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF101010),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  /// Microchipped?
                  customTitleTile(title: "Microchipped?"),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectOption(
                        label: "Microchipped",
                        selectedValue: c.microchip,
                        value: "Microchipped",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Not microchipped",
                        selectedValue: c.microchip,
                        value: "Not microchipped",
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),

                  /// Spayed?
                  customTitleTile(title: "Spayed/Neutered?"),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectOption(
                        label: "Spayed/Neutered",
                        selectedValue: c.spayed,
                        value: "Spayed/Neutered",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Not Spayed/Neutered",
                        selectedValue: c.spayed,
                        value: "Not Spayed/Neutered",
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),

                  /// House trained?
                  customTitleTile(title: "House trained?"),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectOption(
                        label: "House trained",
                        selectedValue: c.houseTrained,
                        value: "House trained",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Not house trained",
                        selectedValue: c.houseTrained,
                        value: "Not house trained",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Unsure if house trained",
                        selectedValue: c.houseTrained,
                        value: "Unsure if house trained",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Depends if house trained",
                        selectedValue: c.houseTrained,
                        value: "Depends if house trained",
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),

                  /// Children friendly?
                  customTitleTile(title: "Children with friendly?"),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectOption(
                        label: "Children with friendly",
                        selectedValue: c.childrenFriendly,
                        value: "Children with friendly",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Not friendly with children",
                        selectedValue: c.childrenFriendly,
                        value: "Not friendly with children",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Unsure if friendly with children",
                        selectedValue: c.childrenFriendly,
                        value: "Unsure if friendly with children",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Depends if friendly with children",
                        selectedValue: c.childrenFriendly,
                        value: "Depends if friendly with children",
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),

                  /// Dog friendly?
                  customTitleTile(title: "Friendly with dogs?"),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectOption(
                        label: "Friendly with dogs",
                        selectedValue: c.dogFriendly,
                        value: "Friendly with dogs",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Not friendly with dogs",
                        selectedValue: c.dogFriendly,
                        value: "Not friendly with dogs",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Unsure if friendly with dogs",
                        selectedValue: c.dogFriendly,
                        value: "Unsure if friendly with dogs",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Depends if friendly with dogs",
                        selectedValue: c.dogFriendly,
                        value: "Depends if friendly with dogs",
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),

                  /// Adoption Date
                  customTitleTile(title: "Adoption Date"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: _adoptionCtrl,
                    hintText: 'Adoption Date',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF5E5E5E),
                    ),
                    readOnly: true,
                    onTap: _pickAdoptionDate,
                  ),
                  SizedBox(height: 14.h),

                  /// About your pet
                  customTitleTile(title: "About your pet"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: descriptionCtrl,
                    hintText: 'Add a description of your pet',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF5E5E5E),
                    ),
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),

            /// ----------------------------------- Care Info -------------------------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFE3E6F0), width: 0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/icon.svg"),
                      SizedBox(width: 8.w),
                      customTitleTile(title: "Care Info"),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Provide your sitter with instructions for walking, feeding and other care",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF585858),
                    ),
                  ),
                  SizedBox(height: 14.h),

                  /// Potty break
                  customTitleTile(title: "Potty break?"),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectOption(
                        label: "Needs a potty break every hour",
                        selectedValue: c.pottyBreak,
                        value: "Needs a potty break every hour",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Needs a potty break every 2 hours",
                        selectedValue: c.pottyBreak,
                        value: "Needs a potty break every 2 hours",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Needs a potty break every 4 hours",
                        selectedValue: c.pottyBreak,
                        value: "Needs a potty break every 4 hours",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Needs a potty break every 8 hours",
                        selectedValue: c.pottyBreak,
                        value: "Needs a potty break every 8 hours",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Special instructions for potty breaks",
                        selectedValue: c.pottyBreak,
                        value: "Special instructions for potty breaks",
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),

                  /// Energy level
                  customTitleTile(title: "Energy level"),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectOption(
                        label: "High energy level",
                        selectedValue: c.energyLevel,
                        value: "High energy level",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Moderate energy level",
                        selectedValue: c.energyLevel,
                        value: "Moderate energy level",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Low energy level",
                        selectedValue: c.energyLevel,
                        value: "Low energy level",
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),

                  /// Feeding schedule
                  customTitleTile(title: "Feeding schedule"),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectOption(
                        label: "Needs to be fed in the morning",
                        selectedValue: c.feedingSchedule,
                        value: "Needs to be fed in the morning",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Needs to be fed twice a day",
                        selectedValue: c.feedingSchedule,
                        value: "Needs to be fed twice a day",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "Special instructions for feeding",
                        selectedValue: c.feedingSchedule,
                        value: "Special instructions for feeding",
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),

                  /// Can be left alone
                  customTitleTile(title: "Can be left alone"),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectOption(
                        label: "Can be left alone for 1 hour or less",
                        selectedValue: c.canBeLeftAlone,
                        value: "Can be left alone for 1 hour or less",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "can be left alone for 1-4 hours",
                        selectedValue: c.canBeLeftAlone,
                        value: "can be left alone for 1-4 hours",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "can be left alone for 4-8 hours",
                        selectedValue: c.canBeLeftAlone,
                        value: "can be left alone for 4-8 hours",
                      ),
                      SizedBox(height: 8.h),
                      SelectOption(
                        label: "special instructions for time alone",
                        selectedValue: c.canBeLeftAlone,
                        value: "special instructions for time alone",
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),

                  /// Medications
                  customTitleTile(title: "Medications"),
                  SizedBox(height: 8.h),
                  Obx(() {
                    return Row(
                      children: [
                        MedicationsButton(
                          label: 'Pill',
                          selected: c.medications.value == 'Pill',
                          onTap: () => c.medications.value = 'Pill',
                        ),
                        SizedBox(width: 6.h),
                        MedicationsButton(
                          label: 'Topical',
                          selected: c.medications.value == 'Topical',
                          onTap: () => c.medications.value = 'Topical',
                        ),
                        SizedBox(width: 6.w),
                        MedicationsButton(
                          label: 'Injection',
                          selected: c.medications.value == 'Injection',
                          onTap: () => c.medications.value = 'Injection',
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: 18.h),

                  /// Pill name
                  customTitleTile(title: "Pill Name"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: _pillCtrl,
                    hintText: 'Name of the pill...',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF5E5E5E),
                    ),
                  ),
                  SizedBox(height: 18.h),

                  customTitleTile(title: "Anything else a sitter should know?"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: _everythingKnowCtrl,
                    hintText: 'Add instructions for walking, feeding or other care',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF5E5E5E),
                    ),
                    maxLines: 5,
                  ),

                ],
              ),
            ),
            SizedBox(height: 18.h),

            /// ----------------------------------- Health Info -----------------------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFE3E6F0), width: 0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/icon.svg"),
                      SizedBox(width: 8.w),
                      customTitleTile(title: "Health Info"),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Add details about your pet’s health care providers",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF585858),
                    ),
                  ),
                  SizedBox(height: 18.h),

                  customTitleTile(title: "Veterinary info"),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: _veterinaryCtrl,
                    hintText: 'Add your vet’s name, address and phone  number',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF5E5E5E),
                    ),
                    maxLines: 5,
                  ),
                  SizedBox(height: 18.h),

                  customTitleTile(title: "Pet insurance provider"),
                  SizedBox(height: 8.h),
                  Text(
                    "This helps your track your pet info all in one place but is not required to book on Wuffoos",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF585858),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  CustomTextField(
                    textEditingController: _pillCtrl,
                    hintText: 'Select insurance provider',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: const Color(0xFF5E5E5E),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 18.h),

            /// Save button
            GestureDetector(
              onTap: _onSave,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  color: AppColors.mainAppColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontFamily: 'BaksoSapi',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.060),
          ],
        ),
      ),
    );
  }


  /// Reusable Title Text
  Widget customTitleTile({required String title}) {
    return Text(
      title,
      style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500),
    );
  }
}
