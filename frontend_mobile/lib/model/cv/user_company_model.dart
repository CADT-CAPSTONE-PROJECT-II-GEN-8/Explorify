// To parse this JSON data, do
//
//     final userCompany = userCompanyFromMap(jsonString);

import 'dart:convert';

UserCompany userCompanyFromMap(String str) =>
    UserCompany.fromMap(json.decode(str));

String userCompanyToMap(UserCompany data) => json.encode(data.toMap());

class UserCompany {
  int userCompanyId;
  String companyName;
  String position;
  String description;
  DateTime startDate;
  DateTime endDate;

  UserCompany({
    required this.userCompanyId,
    required this.companyName,
    required this.position,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  factory UserCompany.fromMap(Map<String, dynamic> json) => UserCompany(
        userCompanyId: json["user_company_id"] ?? '',
        companyName: json["company_name"] ?? '',
        position: json["position"] ?? '',
        description: json["description"] ?? '',
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toMap() => {
        "user_company_id": userCompanyId,
        "company_name": companyName,
        "position": position,
        "description": description,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
      };
}
