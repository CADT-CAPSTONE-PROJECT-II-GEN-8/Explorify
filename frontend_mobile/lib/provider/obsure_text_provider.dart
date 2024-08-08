// is_obscure_provider.dart

import 'package:flutter/material.dart';

class IsObscureProvider extends ChangeNotifier {
  bool _isObscure = true; // Default to obscured text

  bool get isObscure => _isObscure;

  set isObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  void toggleObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
