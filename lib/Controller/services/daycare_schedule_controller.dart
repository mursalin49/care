import 'package:get/get.dart';

class DaycareScheduleController extends GetxController {
  var selectedType = 'oneTime'.obs; // oneTime or repeatWeekly
  var selectedDays = <int>[].obs;   // store selected day indices

  void toggleType(String type) => selectedType.value = type;

  void toggleDay(int index) {
    if (selectedDays.contains(index)) {
      selectedDays.remove(index);
    } else {
      selectedDays.add(index);
    }
  }
}
