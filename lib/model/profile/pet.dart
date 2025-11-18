class PetModel {
  String? name;
  String? imagePath;
  String? type;
  String? gender;
  double? weight;
  int? ageYear;
  int? ageMonth;
  String? dob;
  String? breed;
  String? adoptionDate;
  String? petDescription;


  // Additional info
  String? microchip;
  String? spayed;
  String? houseTrained;
  String? childrenFriendly;
  String? dogFriendly;
  // Care Info
  String? pottyBreak;
  String? energyLevel;
  String? feedingSchedule;
  String? canBeLeftAlone;
  String? pillName;
  String? everythingKnow;
  String? medications;
  // Health info
  String? veterinaryInfo;

  PetModel({
    this.name,
    this.imagePath,
    this.type,
    this.gender,
    this.weight,
    this.ageYear,
    this.ageMonth,
    this.dob,
    this.breed,
    this.adoptionDate,
    this.petDescription,
    this.microchip,
    this.spayed,
    this.houseTrained,
    this.childrenFriendly,
    this.dogFriendly,
    this.pottyBreak,
    this.energyLevel,
    this.feedingSchedule,
    this.canBeLeftAlone,
    this.everythingKnow,
    this.pillName,
    this.medications,
    this.veterinaryInfo,
  });
}
