// company_Profile_provider.dart (Consider renaming for clarity)

import 'package:flutter/material.dart';
import 'package:frontend_mobile/model/internship/company_profile.dart';
import 'package:provider/provider.dart';

// Update provider name to reflect its purpose
final companyProfileProvider = ChangeNotifierProvider<CompanyProfileProvider>(
  create: (context) => CompanyProfileProvider(),
);

class CompanyProfileProvider extends ChangeNotifier {
  CompanyProfile? _companyProfile;

  CompanyProfile? get companyProfile => _companyProfile;

  set companyProfile(CompanyProfile? value) {
    _companyProfile = value;
    notifyListeners();
  }
}
