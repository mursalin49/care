import 'package:get/get.dart';


class SitterBookingStatusController extends GetxController {
  var selectedStatus = 'On going'.obs;

  void selectStatus(String status) {
    selectedStatus.value = status;
  }
}