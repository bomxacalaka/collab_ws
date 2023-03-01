import 'package:collab_ws/jobsPage/addButton.dart';
import 'package:collab_ws/home/components.dart';
import 'package:collab_ws/jobsPage/jobsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../jobsPage/jobsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final user = FirebaseAuth.instance.currentUser;

  final list = [
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.logout),
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
      ),
      scrolledUnderElevation: 1,
      elevation: 1,
      iconTheme: const IconThemeData(color: Colors.black),
      automaticallyImplyLeading: false,
      title: const Text(
          "Appointments",
          style: TextStyle(color: Colors.black)
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/jobs');
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.blue,
                    minimumSize: const Size(300, 70),
                  ),

                  child: const Text('Jobs')
                ),
                const SizedBox(height: 20),

              ]),
        ),
      )
    );
  }
}
