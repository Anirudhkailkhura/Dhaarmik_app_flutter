import 'package:flutter/material.dart';
import 'package:online_product_app/models/auth/login_model.dart';
import 'package:online_product_app/services/authhelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  bool _isObsecure = false;
  bool get isObsecure => _isObsecure;
  set isObsecure(bool newState) {
    _isObsecure = newState;
    notifyListeners();
  }

  bool _processing = false;
  bool get processing => _processing;
  set processing(bool newState) {
    _processing = newState;
    notifyListeners();
  }

  bool _loginResponseBool = false;
  bool get loginResponseBool => _loginResponseBool;
  set loginResponseBool(bool newState) {
    _loginResponseBool = newState;
    notifyListeners();
  }

  bool _responseBool = false;
  bool get responseBool => _responseBool;
  set responseBool(bool newState) {
    _responseBool = newState;
    notifyListeners();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }

  Future<bool> userLogin(LoginModel model) async {
    // Obtain an instance of SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Set a boolean variable 'processing' to true
    processing = true;

    // Call the login method from AuthHelper, passing the LoginModel
    bool response = await AuthHelper().login(model);

    // Set the value of 'loginResponseBool' to the response from the login method
    loginResponseBool = response;

    // Retrieve the boolean value associated with the key "isLogged" from SharedPreferences
    // If the value doesn't exist, use a default value of false
    loggedIn = prefs.getBool("isLogged") ?? false;

    // Return the value of 'loginResponseBool'
    return loginResponseBool;
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.remove("userId");
    prefs.setBool("isLogged", false);
    loggedIn = prefs.getBool("isLogged") ?? false;
  }
}
