import 'package:collab_ws/home/components.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'checkin.dart';

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

    // gets message from API using controllers from the login
    final messageResponse = await checkin(username, password, version, 'register');

    // check response and change to home screen
    if(messageResponse == "You have successfully registered!"){
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }

    // this check makes sure setState doesnt get called the first time when rootApp runs this login class on initialization
    if (username != "ignore") {
      setState(() {
        _postResponse = messageResponse;
      });
    }

//     var uuid = Uuid();
//     // Generate a v1 (time-based) id
//     uuid.v1(); // -> '6c84fb90-12c4-11e1-840d-7b25c5ee775a'
//
//
// // Generate a v4 (random) id
//     uuid.v4(); // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'
//
// // Generate a v5 (namespace-name-sha1-based) id
//     uuid.v5(Uuid.NAMESPACE_URL, 'www.google.com'); // -> 'c74a196f-f19d-5ea9-bffd-a2742432fc9c'

    // if the password is correct,
    // navigate to the home page
    // and remove the login page from the stack
    // so that the user cannot go back to the login page

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
                  const SizedBox(height: 0),
                  // welcoming
                  const Text(
                    "Create an account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 30),

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

