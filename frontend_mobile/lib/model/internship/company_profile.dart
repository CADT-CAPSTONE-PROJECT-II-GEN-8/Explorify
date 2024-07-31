class CompanyProfile {
  int companyId;
  int userId;
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
    required this.userId,
    required this.companyId,
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
        userId: json["user"] as int,
        companyId: json["company_id"] as int,
        companyName: json["company_name"],
        description: json["description"],
        location: json["location"],
        headOffice: json["head_office"],
        employeeSize: json["employee_size"] as int,
        companyType: json["company_type"],
        specialization: json["specialization"],
        companyWebsite: json["company_website"],
        companyPic: json["company_pic"],
      );

  Map<String, dynamic> toMap() => {
        "user": userId,
        "company_id": companyId,
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
