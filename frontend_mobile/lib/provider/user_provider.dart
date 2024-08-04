import 'package:flutter/material.dart';
import 'package:frontend_mobile/model/user/user_model.dart';

class UserProvider extends ChangeNotifier {
  late User _user;

  User get user => _user;

  void setUser(Map<String, dynamic> body) {
    final user = User.fromMap(body);
    _user = user;
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
