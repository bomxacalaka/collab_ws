import 'package:collab_ws/jobsPage/jobsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_page.dart';
import '../home/homeScreen.dart';
// import 'loginPage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const JobsScreen();
        } else {
          return const AuthPage();
        }
      }),
    );
  }
}