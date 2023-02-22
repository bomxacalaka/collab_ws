import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'fields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _postResponse = '';

  Future login(String username, String password) async {
    final url = Uri.parse("https://7d75-134-220-250-238.eu.ngrok.io/login.php");
    final response = await http.post(
        url,
        body: {
          'User': username,
          'password': password,
        }
    );
    setState(() {
      _postResponse = response.body;
    });

    if(response.body == "Password is correct"){
      Navigator.pushNamed(context, '/home');
    }
  }

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

                const SizedBox(height: 20),

                    const simple_text(
                        text: "SPEC5"
                    ),

                    const SizedBox(height: 30),

                    textfield(
                      text: "Email plz",
                      controller: _usernameController,
                      obscureit: false,
                    ), const SizedBox(height: 15,),

                    textfield(
                      text: "Password",
                      controller: _passwordController,
                      obscureit: true,
                    ), const SizedBox(height: 15,),

                    nicebutton(
                        usernameController: _usernameController,
                        passwordController: _passwordController,
                        text: "login here",
                        on_click_action: login
                    ), const SizedBox(height: 15,),

                    register_now(
                        on_click_action: () => Navigator.pushNamed(context, '/register')
                    ),

                  const SizedBox(height: 10,),

                    Text(
                        _postResponse
                    )

              ]),
            ),
          )
      ),
    );
  }
}


