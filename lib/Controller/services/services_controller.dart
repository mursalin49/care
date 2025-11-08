import 'package:get/get.dart';

class ServicesController extends GetxController {
  var selectedService = ''.obs;

  void selectService(String serviceName) {
    selectedService.value = serviceName;
  }
}
