// To parse this JSON data, do
//
//     final userEducation = userEducationFromMap(jsonString);

import 'dart:convert';

UserEducation userEducationFromMap(String str) =>
    UserEducation.fromMap(json.decode(str));

String userEducationToMap(UserEducation data) => json.encode(data.toMap());

class UserEducation {
  int userEducationId;
  String educationLevel;
  String school;
  dynamic major;
  DateTime startDate;
  DateTime endDate;

  UserEducation({
    required this.userEducationId,
    required this.educationLevel,
    required this.school,
    required this.major,
    required this.startDate,
    required this.endDate,
  });

  factory UserEducation.fromMap(Map<String, dynamic> json) => UserEducation(
        userEducationId: json["user_education_id"] ?? '',
        educationLevel: json["education_level"] ?? '',
        school: json["school"] ?? '',
        major: json["major"] ?? '',
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toMap() => {
        "user_education_id": userEducationId,
        "education_level": educationLevel,
        "school": school,
        "major": major,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
      };
}
