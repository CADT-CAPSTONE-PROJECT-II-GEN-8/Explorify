import 'package:frontend_mobile/model/internship/company_profile.dart';
import 'package:frontend_mobile/model/internship/internship_posting.dart';

class InternshipWithCompany {
  final Internship internship;
  final CompanyProfile? company;

  InternshipWithCompany({required this.internship, required this.company});
}
