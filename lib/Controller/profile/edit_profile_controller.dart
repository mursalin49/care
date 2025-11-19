import 'dart:io' show File;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class EditProfile extends GetxController {

  RxString userProfileImageUrl = ''.obs;
  File? selectedImage;

  Rx<File?> selectedImageEDT = Rx<File?>(null);
  RxString imagesPath = ''.obs;

  Future pickImage(ImageSource source) async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;

    final extension = pickedFile.path.split('.').last.toLowerCase();
    if (!['jpg', 'jpeg', 'png'].contains(extension)) {
      Get.snackbar("Invalid Format", "Only JPG, JPEG, PNG files are allowed.");
      return;
    }

    selectedImageEDT.value = File(pickedFile.path);
    imagesPath.value = selectedImageEDT.value!.path;
    update();
  }
}