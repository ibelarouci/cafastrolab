import 'package:flutter/material.dart';

class ProfileModel extends ChangeNotifier {
  String institution = '';
  String selectedGrade = '';
  String age = '';
  String gender = '';

  void updateInstitution(String value) {
    institution = value;
    notifyListeners();
  }

  void updateSelectedGrade(String value) {
    selectedGrade = value;
    notifyListeners();
  }

  void updateAge(String value) {
    age = value;
    notifyListeners();
  }

  void updateGender(String value) {
    gender = value;
    notifyListeners();
  }

  // Add other methods and logic as needed for your profile data
}
