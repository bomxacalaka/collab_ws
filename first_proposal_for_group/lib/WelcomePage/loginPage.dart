// import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import '../home/components.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:collab_ws/main.dart';

import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future login(String username, String password) async {
    //check if
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password
    ).catchError((error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message)));
    });
  }



  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                    // checkLocalLogin(),
                    const SizedBox(height: 20),

                    const SimpleText(
                        text: "SPEC5"
                    ),

                    const SizedBox(height: 30),

                    TextFieldHere(
                      text: "Username",
                      controller: _usernameController,
                      obscureIt: false,
                    ), const SizedBox(height: 15,),

                    TextFieldHere(
                      text: "Password",
                      controller: _passwordController,
                      obscureIt: true,
                    ),

                    Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () => widget.showRegisterPage(),
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return const ForgotPasswordPage();
                                        }),
                                      )
                                    },
                                    child: const Text("Forgot password?",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                              )
                            ]
                        )
                    ),

                    NiceButton(
                        usernameController: _usernameController,
                        passwordController: _passwordController,
                        text: "Login",
                        onClickAction: login
                    ),

                    SmallTextButton(
                        onClickAction: () => widget.showRegisterPage(),
                      text1: "Don't have an account?",
                      text2: "Register now",
                    ),

              ]),
            ),
          )
      ),
    );
  }
}


