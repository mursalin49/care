import 'package:get/get.dart';

class PetSelectionController extends GetxController {
  var selectedPetIndex = (-1).obs; // currently selected in bottom sheet
  var confirmedPets = <Map<String, String>>[].obs; // multiple confirmed pets

  List<Map<String, String>> pets = [
    {
      "name": "Max",
      "breed": "Australian Shepherds",
      "image": "assets/images/bigPet.png",
    },
    {
      "name": "Bob",
      "breed": "Australian Shepherds",
      "image": "assets/images/bigPet.png",
    },
    {
      "name": "Rock",
      "breed": "Australian Shepherds",
      "image": "assets/images/bigPet.png",
    },
  ];

  void selectPet(int index) {
    selectedPetIndex.value = index;
  }

  void confirmSelection() {
    if (selectedPetIndex.value != -1) {
      final pet = pets[selectedPetIndex.value];
      if (!confirmedPets.contains(pet)) {
        confirmedPets.add(pet); // ✅ add new pet
      }
    }
  }

  void removePet(Map<String, String> pet) {
    confirmedPets.remove(pet);
  }
}
