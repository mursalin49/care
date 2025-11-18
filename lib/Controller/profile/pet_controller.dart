import 'package:get/get.dart';
import '../../model/profile/pet.dart';


class PetController extends GetxController {
  var pets = <PetModel>[].obs;

  // BASIC INFO
  var petType = "".obs;
  var name = "".obs;
  var weight = "".obs;
  var ageYear = "".obs;
  var ageMonth = "".obs;
  var dob = "".obs;
  var breed = "".obs;
  var gender = "".obs;
  var adopDate = "".obs;
  var description = "".obs;

  // Additional
  var microchip = "".obs;
  var spayed = "".obs;
  var houseTrained = "".obs;
  var childrenFriendly = "".obs;
  var dogFriendly = "".obs;

  // Care info
  var pottyBreak = "".obs;
  var energyLevel = "".obs;
  var feedingSchedule = "".obs;
  var canBeLeftAlone = "".obs;
  var pillName = "".obs;
  var everythingKnow = "".obs;
  var medications = "".obs;
  var veterinaryInfo = "".obs;

  // Image
  var petImage = RxnString();

  // SAVE PET AS MODEL
  void savePet() {
    final pet = PetModel(
      name: name.value,
      imagePath: petImage.value,
      type: petType.value,
      gender: gender.value,
      weight: double.tryParse(weight.value),
      ageYear: int.tryParse(ageYear.value),
      ageMonth: int.tryParse(ageMonth.value),
      dob: dob.value,
      adoptionDate: adopDate.value,
      petDescription: description.value,

      breed: breed.value,
      microchip: microchip.value,
      spayed: spayed.value,
      houseTrained: houseTrained.value,
      childrenFriendly: childrenFriendly.value,
      dogFriendly: dogFriendly.value,
      pottyBreak: pottyBreak.value,
      energyLevel: energyLevel.value,
      feedingSchedule: feedingSchedule.value,
      canBeLeftAlone: canBeLeftAlone.value,
      pillName: pillName.value,
      everythingKnow: everythingKnow.value,
      medications: medications.value,
      veterinaryInfo: veterinaryInfo.value,
    );

    pets.add(pet);
    clearForm();
  }

  void clearForm() {
    petType.value = "";
    name.value = "";
    weight.value = "";
    ageYear.value = "";
    ageMonth.value = "";
    dob.value = "";
    breed.value = "";
    gender.value = "";
    adopDate.value = "";
    description.value = "";

    microchip.value = "";
    spayed.value = "";
    houseTrained.value = "";
    childrenFriendly.value = "";
    dogFriendly.value = "";
    pottyBreak.value = "";
    energyLevel.value = "";
    feedingSchedule.value = "";
    canBeLeftAlone.value = "";
    pillName.value = "";
    everythingKnow.value = "";
    medications.value = "";
    veterinaryInfo.value = "";
    petImage.value = null;
  }
}
