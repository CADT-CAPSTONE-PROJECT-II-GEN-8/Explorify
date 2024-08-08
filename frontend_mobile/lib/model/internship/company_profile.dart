class CompanyProfile {
  String companyName;
  String description;
  String location;
  String? headOffice;
  int? employeeSize;
  String? companyType;
  String? specialization;
  String? companyWebsite;
  String companyPic;

  CompanyProfile({
    required this.companyName,
    required this.description,
    required this.location,
    this.headOffice,
    this.employeeSize,
    this.companyType,
    this.specialization,
    this.companyWebsite,
    required this.companyPic,
  });

  factory CompanyProfile.fromMap(Map<String, dynamic> json) => CompanyProfile(
        companyName: json["company_name"] as String,
        description: json["description"],
        location: json["location"],
        headOffice: json["head_office"],
        employeeSize: json["employee_size"] as int,
        companyType: json["company_type"],
        specialization: json["specialization"],
        companyWebsite: json["company_website"],
        companyPic: json["company_pic"] as String ?? '',
      );

  Map<String, dynamic> toMap() => {
        "company_name": companyName,
        "description": description,
        "location": location,
        "head_office": headOffice,
        "employee_size": employeeSize,
        "company_type": companyType,
        "specialization": specialization,
        "company_website": companyWebsite,
        "company_pic": companyPic,
      };
}

class MyUser {
  final CompanyProfile companyProfile;

  MyUser({
    required this.companyProfile,
  });

  factory MyUser.fromJson(Map<String, dynamic> json) => MyUser(
        companyProfile: CompanyProfile.fromMap(json['company_profile']),
      );
  Map<String, dynamic> toMap() {
    return {
      'company_profile': companyProfile.toMap(),
    };
  }
}
