import 'package:collab_ws/jobsPage/manager/rootApp.dart';
import 'package:flutter/material.dart';
import 'WelcomePage/loginPage.dart';
import 'WelcomePage/registerPage.dart';
import 'WelcomePage/homeScreen.dart';
import 'jobsPage/jobsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp( );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized();
    // SharedPreferences.getInstance().then((prefs) {
    //   var token = prefs.getString('token');
    //   runApp(MaterialApp(home: token == null ? LoginPage() : HomePage()));
    // });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/jobs': (context) => JobsScreen(),
      }
    );
  }
}