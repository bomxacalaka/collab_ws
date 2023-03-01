import 'package:collab_ws/jobsPage/addButton.dart';
import 'package:collab_ws/home/components.dart';
import 'package:collab_ws/jobsPage/jobsScreen.dart';
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

  String _response = 'press here to get';

  // Future register() async {
  //   final url = Uri.parse("https://7d75-134-220-250-238.eu.ngrok.io/register.php");
  //   final response = await http.post(
  //       url,
  //       body: {
  //         'User': "thisisatest",
  //         'password': "randompassword",
  //       }
  //   ); // possible response = ["Failed to connect to MySQL:", "Email already exists", "SQL error dscription:", "You have successfully registered!"]
  //   setState(() {
  //     _postResponse = response.body.substring(0, 19);
  //   });
  //
  //   // Obtain shared preferences.
  //   final prefs = await SharedPreferences.getInstance();
  //   if (_postResponse == "You have successfully registered!") {
  //     Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  //     // Save an String value to 'action' key.
  //     await prefs.setString('username', "thisisatest");
  //     await prefs.setString('token', response.body.substring(19));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      scrolledUnderElevation: 1,
      elevation: 1,
      // shadowColor: Colors.transparent,
      // flexibleSpace: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       colors: <Color>[
      //         Colors.grey,
      //         Colors.white,
      //       ],
      //     ),
      //   ),
      // ),
      iconTheme: const IconThemeData(color: Colors.black),
      automaticallyImplyLeading: false,
      title: const Text(
          "Home",
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
                const Logout(),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    setState(() {
                      _response = prefs.getString('password')!;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.blue,
                    minimumSize: const Size(300, 70),
                  ),

                  child: Text(_response)
                ),
              ]),
        ),
      )
    );
  }
}
