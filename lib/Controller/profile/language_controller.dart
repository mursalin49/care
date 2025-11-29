import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLang = "English".obs;

  void selectLanguage(String lang) {
    selectedLang.value = lang;
  }
}