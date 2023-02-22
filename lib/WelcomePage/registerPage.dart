import 'package:collab_ws/WelcomePage/components.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _postResponse = '';
  
  Future register(String username, String password) async {
    final url = Uri.parse("https://7d75-134-220-250-238.eu.ngrok.io/register.php");
    final response = await http.post(
        url,
        body: {
          'User': "${username}",
          'password': "${password}",
        }
    ); // possible response = ["Failed to connect to MySQL:", "Email already exists", "SQL error dscription:", "You have successfully registered!"]
    setState(() {
      _postResponse = response.body.substring(0, 19);
    });

    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    if (_postResponse == "You have successfully registered!") {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      // Save an String value to 'action' key.
      await prefs.setString('username', username);
      await prefs.setString('token', response.body.substring(19));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 0),
                  // welcoming
                  Text(
                    "Create an account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  SizedBox(height: 30),

                  TextFieldHere(text: "Email", controller: _usernameController, obscureIt: false,), const SizedBox(height: 15,),

                  TextFieldHere(text: "Password", controller: _passwordController, obscureIt: true,), const SizedBox(height: 15,),

                  NiceButton(usernameController: _usernameController, passwordController: _passwordController, text: "Create account", onClickAction: register),

                  Text(
                      _postResponse
                  )

                ]),
          )
      ),
    );
  }
}

