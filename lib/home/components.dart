import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextFieldHere extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool obscureIt;

  const TextFieldHere({
    super.key,
    required this.text,
    required this.controller,
    required this.obscureIt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(250, 250, 250, 1),
          border: Border.all(color: const Color.fromRGBO(241, 241, 241, 1)),
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
            controller: controller,
            obscureText: obscureIt,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
            ),
          ),
        ),
      ),
    );
  }
}

// used on login and register pages buttons
class NiceButton extends StatelessWidget{

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String text;
  final Function onClickAction;

  const NiceButton ({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.text,
    required this.onClickAction,
});

  @override
  Widget build(BuildContext context){
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: GestureDetector(
          onTap: () {
            onClickAction(
                usernameController.text.trim(),
                passwordController.text.trim());
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class RegisterNow extends StatelessWidget{
  final Function onClickAction;

  const RegisterNow ({
    super.key,
    required this.onClickAction,
});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Not registered?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            "Register now",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class SimpleText extends StatelessWidget{
  final String text;

  const SimpleText ({
    super.key,
    required this.text,
});

  @override
  Widget build(BuildContext context){
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}



class Logout extends StatelessWidget{
  const Logout ({
    super.key,
});

  void logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');
    Navigator.pushNamed(context, '/root');
  }

    @override
    Widget build(BuildContext context){
      return GestureDetector(
        onTap: () {
          logout(context);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5)
          ),
          child: const Center(
            child: Text(
              "Logout",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),
            ),
          ),
        ),
      );
    }
}