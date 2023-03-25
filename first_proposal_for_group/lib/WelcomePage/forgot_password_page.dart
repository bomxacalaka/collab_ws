import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../home/components.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _emailController = TextEditingController();

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim());
    } on FirebaseAuthException catch(e){
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
      }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              "Reset Password",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),),
          const SizedBox(height: 20,),
          TextFieldHere(
            text: "Email",
            controller: _emailController,
            obscureIt: false,
          ),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "An email confirming reset of your password will be sent to you",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),),
          ),
          const SizedBox(height: 10,),
          MaterialButton(onPressed: () { resetPassword(); },
            color: Colors.white,
            child: const Text("Reset Password"),
          )
        ],
      ),
    );
  }
}
