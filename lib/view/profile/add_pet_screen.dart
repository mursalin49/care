
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:petcare/utils/app_colors.dart';
import 'package:petcare/view/components/custom_app_bar.dart';
import 'package:petcare/view/profile/widget/custom_chip.dart';
import 'package:petcare/view/profile/widget/gender_button.dart';
import 'package:petcare/view/profile/widget/pet_type_box.dart';
import '../../model/profile/pet.dart';
import '../components/custom_text_field.dart';


class AddPetScreen extends StatefulWidget {
  const AddPetScreen({Key? key}) : super(key: key);

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _nameCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _ageYearCtrl = TextEditingController();
  final _ageMonthCtrl = TextEditingController();
  final _dobCtrl = TextEditingController();
  final _breedCtrl = TextEditingController();

  String _selectedType = 'Dog';
  String _selectedGender = 'Male';
  bool _microchipped = false;
  bool _spayed = false;

  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource src) async {
    final XFile? xfile = await _picker.pickImage(source: src, imageQuality: 80, maxWidth: 1200);
    if (xfile == null) return;
    setState(() {
      _imageFile = File(xfile.path);
    });
  }

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
              if (_imageFile != null)
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Remove Photo'),
                  onTap: () {
                    setState(() => _imageFile = null);
                    Navigator.pop(ctx);
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickDob() async {
    final DateTime now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1990),
      lastDate: now,
    );
    if (picked != null) {
      _dobCtrl.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  void _onSave() {
    if (_nameCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter pet name')));
      return;
    }

    final weight = double.tryParse(_weightCtrl.text.trim());
    final ageYear = int.tryParse(_ageYearCtrl.text.trim());
    final ageMonth = int.tryParse(_ageMonthCtrl.text.trim());

    final pet = PetModel(
      name: _nameCtrl.text.trim(),
      imagePath: _imageFile?.path ?? '',
      type: _selectedType,
      gender: _selectedGender,
      weight: weight,
      ageYear: ageYear,
      ageMonth: ageMonth,
      dob: _dobCtrl.text.isEmpty ? null : _dobCtrl.text,
      breed: _breedCtrl.text.isEmpty ? null : _breedCtrl.text,
    );

    Navigator.pop(context, pet); // return to previous screen
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _weightCtrl.dispose();
    _ageYearCtrl.dispose();
    _ageMonthCtrl.dispose();
    _dobCtrl.dispose();
    _breedCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Pet",
        showBackButton: true,
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.043),

            /// ------------------- Upload Pet Photo section ------------------------
            GestureDetector(
              onTap: _showImageOptions,
              child: Container(
                height: 163.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12.r),
                  image: _imageFile != null
                      ? DecorationImage(image: FileImage(_imageFile!), fit: BoxFit.cover)
                      : null,
                ),
                child: _imageFile == null
                    ? Center(
                  child: GestureDetector(
                    onTap: _showImageOptions,
                    child: SvgPicture.asset("assets/images/uploadImg.svg", color: AppColors.mainAppColor,),
                  ),
                ) : Stack(
                  children: [
                    Positioned(
                      right: 10,
                      top: 10,
                      child: InkWell(
                        onTap: () => setState(() => _imageFile = null),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.black.withOpacity(0.4), shape: BoxShape.circle),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(Icons.close, color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
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
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/icon.svg"),
                      SizedBox(width: 8.w),
                      customTitleTile(
                        title: "Pet Details"
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),

                  Text(
                    "Provide your sitter with a description of your pet",
                    style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF585858)
                    ),
                  ),
                  SizedBox(height: 14.h),

                  customTitleTile(
                    title: "What typ of pet?",
                  ),
                  SizedBox(height: 8.h),


                  /// Type selection (Dog / Cat)
                  Row(
                    children: [
                      Expanded(
                        child: PetTypeBox(
                          label: 'Dogs',
                          icon: SvgPicture.asset("assets/icons/dogIcon.svg"),
                          selected: _selectedType == 'Dog',
                          onTap: () => setState(() => _selectedType = 'Dog'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: PetTypeBox(
                          label: 'Cats',
                          icon: SvgPicture.asset("assets/icons/catIcon.svg"),
                          selected: _selectedType == 'Cat',
                          onTap: () => setState(() => _selectedType = 'Cat'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),

                  customTitleTile(
                    title: "Name",
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: _nameCtrl,
                    hintText: 'Pet Name',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color(0xFF5E5E5E),
                    ),
                    fillColor: Color(0xFFFFFFFF),
                    fieldBorderColor: AppColors.borderColor,
                  ),
                  SizedBox(height: 14.h),

                  customTitleTile(
                    title: "Weight (lbs)",
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: _weightCtrl,
                    hintText: 'Weight',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color(0xFF5E5E5E),
                    ),
                    fillColor: Color(0xFFFFFFFF),
                    fieldBorderColor: AppColors.borderColor,
                  ),
                  SizedBox(height: 14.h),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customTitleTile(
                              title: "Age(Year)",
                            ),
                            SizedBox(height: 8.h),
                            CustomTextField(
                              textEditingController: _ageYearCtrl,
                              hintText: 'Age(Year)',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat-Regular',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Color(0xFF5E5E5E),
                              ),
                              fillColor: Color(0xFFFFFFFF),
                              fieldBorderColor: AppColors.borderColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customTitleTile(
                              title: "Age (Month)",
                            ),
                            SizedBox(height: 8.h),
                            CustomTextField(
                              textEditingController: _ageMonthCtrl,
                              hintText: 'Age (Month)',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat-Regular',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Color(0xFF5E5E5E),
                              ),
                              fillColor: Color(0xFFFFFFFF),
                              fieldBorderColor: AppColors.borderColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 14.h),

                  customTitleTile(
                    title: "Date of birth",
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    textEditingController: _dobCtrl,
                    hintText: 'Date of birth',
                    readOnly: true,
                    onTap: _pickDob,
                  ),
                  SizedBox(height: 14.h),

                  customTitleTile(
                    title: "Breed",
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField
                    (textEditingController: _breedCtrl,
                    hintText: 'Breed',
                  ),
                  SizedBox(height: 14.h),

                  customTitleTile(
                    title: "Gender",
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      GenderButton(
                        label: 'Male',
                        selected: _selectedGender == 'Male',
                        onTap: () => setState(() => _selectedGender = 'Male'),
                      ),
                      const SizedBox(width: 10),
                      GenderButton(
                        label: 'Female',
                        selected: _selectedGender == 'Female',
                        onTap: () => setState(() => _selectedGender = 'Female'),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  Divider(
                    thickness: 1,
                    color: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 15.h),

                  /// ------------------------------------------ Additional Details ------------------------------


                ],
              ),
            ),
            SizedBox(height: 18),

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

  Widget customTitleTile({
    required String title,
  }) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

}
