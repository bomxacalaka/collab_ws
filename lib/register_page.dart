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

  
  Future register(String username, String password) async {
    final url = Uri.parse("https://7d75-134-220-250-238.eu.ngrok.io/register.php");
    final response = await http.post(
        url,
        body: {
          'email': "${username}",
          'password': "${password}",
        }
    );
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

                  // email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(250, 250, 250, 1),
                        border: Border.all(color: Color.fromRGBO(241, 241, 241, 1)),
                        borderRadius: BorderRadius.circular(12),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 1,
                        //     blurRadius: 2,
                        //     offset: Offset(0, 1), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),


                  // password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(250, 250, 250, 1),
                        border: Border.all(color: Color.fromRGBO(241, 241, 241, 1)),
                        borderRadius: BorderRadius.circular(12),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 1,
                        //     blurRadius: 2,
                        //     offset: Offset(0, 1), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),


                  // Create account button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        register(
                            _usernameController.text.trim(),
                            _passwordController.text.trim()
                        );
                        // Navigator.pushNamed(context, '/login');
                        print("Create account button pressed");
                      },

                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text(
                            "Create account",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                ]),
          )
      ),
    );
  }
}

