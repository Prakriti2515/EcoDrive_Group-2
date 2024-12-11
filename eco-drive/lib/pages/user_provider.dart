import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _username = '';
  String _email = '';
  String _phone = '';
  String _profession = '';

  String get username => _username;
  String get email => _email;
  String get phone => _phone;
  String get profession => _profession;

  // Method to update user information
  void updateUserInfo(String phone, String profession) {
    _phone = phone;
    _profession = profession;
    notifyListeners(); // Notify listeners to update UI
  }

  // Method to set the username and email after successful login
  void setUserInfo(String username, String email) {
    _username = username;
    _email = email;
    notifyListeners();
  }
}
