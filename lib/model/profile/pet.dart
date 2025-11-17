import 'dart:io';

class PetModel {
  final String name;
  final String imagePath; // local file path (can be empty for default)
  final String type; // "Dog" or "Cat"
  final String gender; // "Male" / "Female"
  final double? weight; // in lbs
  final int? ageYear;
  final int? ageMonth;
  final String? dob; // formatted date string
  final String? breed;

  PetModel({
    required this.name,
    required this.imagePath,
    required this.type,
    required this.gender,
    this.weight,
    this.ageYear,
    this.ageMonth,
    this.dob,
    this.breed,
  });

  // Convenience to display a placeholder if no image
  bool get hasImage => imagePath.isNotEmpty;
}
