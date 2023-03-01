import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'loginPage.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
  }

  class _RootAppState extends State<RootApp>{

// Future<void> autoLogin() async {
//   final prefs = await SharedPreferences.getInstance();
//   var cachedUsername = prefs.getString('username');
//   final cachedPassword = prefs.getString('password');
//
//   if (cachedUsername!=null&&cachedPassword!=null){
//     LoginPage();
//     // login("doesntMatter", "doesntMatter");
//   }
// }

  @override
  initState() {
  super.initState();
  Future.delayed(const Duration(seconds: 0), () {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    Navigator.pushNamed(context, "/home");
  });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
             // add image
            Text(
              "SPEC5",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}