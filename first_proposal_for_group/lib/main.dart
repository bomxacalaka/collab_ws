import 'package:collab_ws/WelcomePage/rootApp.dart';
import 'package:collab_ws/jobsPage/edit_job.dart';
import 'package:collab_ws/jobsPage/job_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'WelcomePage/loginPage.dart';
import 'WelcomePage/registerPage.dart';
import 'home/homeScreen.dart';
import 'jobsPage/add_job.dart';
import 'jobsPage/jobsScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

const String version = "0.0.0";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}
// added ios imples
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
        '/login': (context) => LoginPage(showRegisterPage: () {  },),
        '/register': (context) => RegisterPage(showLoginPage: () {  },),
        '/home': (context) => const HomePage(),
        '/jobs': (context) => const JobsScreen(),
        '/root': (context) => const RootApp(),
        '/job_description': (context) => const JobDescription(),
        '/add_job': (context) => const AddJob(),
        '/edit_job': (context) => const EditJob(),
      }
    );
  }
}