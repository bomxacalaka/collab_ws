import 'package:collab_ws/fields.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      _postResponse = response.body;
    });
    if (_postResponse == "You have successfully registered!") {
      Navigator.pushNamed(context, '/home');
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

                  textfield(text: "Email plz", controller: _usernameController, obscureit: false,), const SizedBox(height: 15,),

                  textfield(text: "Password", controller: _passwordController, obscureit: true,), const SizedBox(height: 15,),

                  nicebutton(usernameController: _usernameController, passwordController: _passwordController, text: "Create account", on_click_action: register),

                  Text(
                      _postResponse
                  )

                ]),
          )
      ),
    );
  }
}

