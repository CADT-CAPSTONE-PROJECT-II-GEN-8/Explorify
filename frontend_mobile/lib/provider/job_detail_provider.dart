// internship_provider.dart
import 'package:flutter/material.dart';
import 'package:frontend_mobile/model/internship/internship_posting.dart';
import 'package:provider/provider.dart';

final internshipProvider = ChangeNotifierProvider<InternshipProvider>(
  create: (context) => InternshipProvider(),
);

class InternshipProvider extends ChangeNotifier {
  Internship? _internshipInfo;

  Internship? get internshipInfo => _internshipInfo;

  set internshipInfo(Internship? value) {
    _internshipInfo = value;
    notifyListeners();
  }
}
