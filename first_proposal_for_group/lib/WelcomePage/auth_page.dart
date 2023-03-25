import 'package:collab_ws/WelcomePage/registerPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/homeScreen.dart';
import 'loginPage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'loginPage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool isLogin = true;

  void togglePage() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
      if (isLogin) {
        return LoginPage(showRegisterPage: togglePage);
      } else {
        return RegisterPage(showLoginPage: togglePage);
      }
  }
}