import 'package:flutter/material.dart';
import 'package:online_product_app/models/auth/login_model.dart';
import 'package:online_product_app/models/auth/signup_model.dart';
import 'package:online_product_app/services/authhelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Notifier class for handling login, logout, and user registration state
class LoginNotifier extends ChangeNotifier {
  // State for managing password visibility in the login form
  bool _isObsecure = false;
  bool get isObsecure => _isObsecure;
  set isObsecure(bool newState) {
    _isObsecure = newState;
    notifyListeners();
  }

  // State for indicating processing/loading state during login or registration
  bool _processing = false;
  bool get processing => _processing;
  set processing(bool newState) {
    _processing = newState;
    notifyListeners();
  }

  // State for storing the boolean result of a login attempt
  bool _loginResponseBool = false;
  bool get loginResponseBool => _loginResponseBool;
  set loginResponseBool(bool newState) {
    _loginResponseBool = newState;
    notifyListeners();
  }

  // State for storing the boolean result of a registration attempt
  bool _responseBool = false;
  bool get responseBool => _responseBool;
  set responseBool(bool newState) {
    _responseBool = newState;
    notifyListeners();
  }

  // State for tracking the user's login status
  bool? _loggedIn;
  bool get loggedIn => _loggedIn ?? false;
  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }

  // Asynchronous function for handling user login
  Future<bool> userLogin(LoginModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Set processing state to true during login attempt
    processing = true;

    // Perform login using AuthHelper class
    bool response = await AuthHelper().login(model);

    // Set processing state back to false after login attempt
    processing = false;

    // Update login response state
    loginResponseBool = response;

    // Update the loggedIn state based on SharedPreferences
    loggedIn = prefs.getBool("isLogged") ?? false;

    return loginResponseBool;
  }

  // Synchronous function for handling user logout
  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Remove token and userId from SharedPreferences
    prefs.remove("token");
    prefs.remove("userId");

    // Set isLogged to false in SharedPreferences
    prefs.setBool("isLogged", false);

    // Update loggedIn state based on SharedPreferences
    loggedIn = prefs.getBool("isLogged") ?? false;
  }

  // Asynchronous function for handling user registration
  Future<bool> registerUser(SignupModel model) async {
    // Perform user registration using AuthHelper class
    responseBool = await AuthHelper().signup(model);

    return responseBool;
  }
}



//test@gmail.com
//test123