import 'package:collab_ws/jobsScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'jobsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/jobs'), child: Text('Jobs')),
                    // welcoming
                    Text(
                      "HOME PAGE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),

                    SizedBox(height: 30),

                  ]),
            ),
          )
      ),
    );
  }
}
