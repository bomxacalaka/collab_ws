import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// gets username and password and returns if login was successful or not
Future checkin(String username, String password, String version, String mode) async {

  if (mode == "login" && username == "ignore"){
    final prefs = await SharedPreferences.getInstance();
    var cachedUsername = prefs.getString('username');
    final cachedPassword = prefs.getString('password');
    if (cachedUsername != null && cachedPassword != null) {
      final url = Uri.parse(
          "https://7d75-134-220-250-238.eu.ngrok.io/checkin.php");
      final response = await http.post(
          url,
          body: {
            'user': cachedUsername ??= '',
            'password': 'doesntMatter',
            'version': version,
            'mode': 'passFromUser',
          }
      );

      if (jsonDecode(response.body)['user']['password'] == cachedPassword) {
        return "Login successful";
      }

      if (kDebugMode) {
        print("cached user: $cachedUsername");
        print("cached pass: $cachedPassword");
        print("checkin.dart, password check response message: ${response.body}");
        print(jsonDecode(response.body)['user']['password'] == cachedPassword);
      }
    }
  }

  //POST request to login.php with username and password as body parameters
  final url = Uri.parse("https://7d75-134-220-250-238.eu.ngrok.io/checkin.php");
  final response = await http.post(
      url,
      body: {
        'user': username ??= '',
        'password': password ??= '',
        'version': version,
        'mode': mode,
      }
  );

  if (kDebugMode) {
    print("checkin.dart, response message: ${jsonDecode(response.body)['user']['message']}");
  }

  if (jsonDecode(response.body)['user']['message'] != null) {
    final String messageResponse = jsonDecode(response.body)['user']['message'];
    // check if password is correct and save username and password to shared preferences
    if (messageResponse == "Login successful" || messageResponse == "You have successfully registered!") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('username', jsonDecode(response.body)['user']['username']);
      prefs.setString('password', jsonDecode(response.body)['user']['password']);
    }
  }

  return jsonDecode(response.body)['user']['message'];
}