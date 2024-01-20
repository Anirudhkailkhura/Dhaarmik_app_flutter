import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:online_product_app/models/auth/login_model.dart';
import 'package:online_product_app/models/auth/signup_model.dart';
import 'package:online_product_app/models/auth_response/login_res_model.dart';
import 'package:online_product_app/models/auth_response/profile_model.dart';
import 'package:online_product_app/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static var client = http.Client(); // HTTP client for making requests

  Future<bool> login(LoginModel model) async {
    // Setting up request headers
     Map<String, String> requestHeaders = {"content-Type": "application/json"};

    // Constructing the URL using Config class
    var url = Uri.https(Config.apiUrl, Config.loginUrl);

    // Making a POST request to the login URL with the provided model data
   var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    // Checking if the response status code is 200 (OK)
    if (response.statusCode == 200) {
      // If the response is successful, extract token and id from the response

      // Saving the token and id to SharedPreferences for future use
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String userToken = loginResponseModelFromJson(response.body).token;
      String userId = loginResponseModelFromJson(response.body).id;

      await prefs.setString("token", userToken);
      await prefs.setString("userId", userId);
      await prefs.setBool("isLogged", true);
      // Returning true to indicate successful login
      return true;
    } else {
      // If the response status code is not 200, return false to indicate a failed login
      return false;
    }
  }

  Future<bool> signup(SignupModel model) async {
    // Set up request headers
    Map<String, String> requestHeaders = {"content-Type": "application/json"};

    // Construct the URL for user signup using the Config class
    var url = Uri.https(Config.apiUrl, Config.signupUrl);
    print(url);

    // Make a POST request to the signup URL with the provided model data
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );

    log(response.body, name: "AuthSignUp");

    // Check if the response status code is 201 (Created)
    if (response.statusCode < 300) {
      // If successful signup, return true
      return true;
    } else {
      // If the response status code is not 201, return false
      return false;
    }
  }

  Future<ProfileRes> getProfile() async {
    // Retrieve the user token from SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString("token");

    // Set up request headers including the user token for authentication
    Map<String, String> requestHeaders = {
      "content-Type": "application/json",
      "token": "Bearer $userToken"
    };

    // Construct the URL for fetching the user profile
    var url = Uri.https(Config.apiUrl, Config.getUserUrl);

    // Make a POST request to the profile URL with the provided headers
    var response = await client.post(
      url,
      headers: requestHeaders,
    );

    // Check if the response status code is 200 (OK)
    if (response.statusCode == 200) {
      // If successful, parse the response body into a ProfileRes object
      var profile = profileResFromJson(response.body);
      return profile;
    } else {
      // If the response status code is not 200, throw an exception with an error message
      throw Exception("Failed to get profile");
    }
  }
}
