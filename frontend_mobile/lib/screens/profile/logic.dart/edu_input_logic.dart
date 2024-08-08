import 'package:flutter/material.dart';
import 'package:frontend_mobile/model/cv/education_level_model.dart';
import 'package:intl/intl.dart';

class EduInputLogic extends ChangeNotifier {
  String educationLevel = 'none';
  String school = 'none'; // Assuming you want username as well
  String major = "none";
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  void updateEducationLevel(String newLevel) {
    educationLevel = newLevel;
    notifyListeners(); // Notify listeners (RegisterPage) about changes
  }

  void updateSchool(String newSchool) {
    school = newSchool;
    notifyListeners();
  }

  void updateMajor(String newMajor) {
    major = newMajor;
    notifyListeners();
  }

  void updateStartDate(DateTime newStartDate) {
    startDate = newStartDate;
    notifyListeners();
  }

  void updateEndtDate(DateTime newEndDate) {
    endDate = newEndDate;
    notifyListeners();
  }
}
