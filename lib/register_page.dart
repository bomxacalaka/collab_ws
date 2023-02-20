import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
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


                  // login button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  SizedBox(height: 15,),
                ]),
          )
      ),
    );
  }
}
