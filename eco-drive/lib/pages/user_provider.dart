import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _username = '';
  String _email = '';

  var phone;

  var profession;

  String get username => _username;
  String get email => _email;

  void setUser(String username, String email) {
    _username = username;
    _email = email;
    notifyListeners();
  }

  void updateUserInfo(String updatedPhone, String updatedProfession) {}
}
