import 'package:collab_ws/WelcomePage/rootApp.dart';
import 'package:flutter/material.dart';
import 'WelcomePage/loginPage.dart';
import 'WelcomePage/registerPage.dart';
import 'home/homeScreen.dart';
import 'jobsPage/jobsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

const String version = "0.0.0";

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp( );
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
      home: const RootApp(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/jobs': (context) => const JobsScreen(),
        '/root': (context) => const RootApp(),
      }
    );
  }
}