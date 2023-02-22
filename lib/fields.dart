import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool obscureit;

  const textfield({
    super.key,
    required this.text,
    required this.controller,
    required this.obscureit,
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
            obscureText: obscureit,
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


class nicebutton extends StatelessWidget{

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String text;
  final Function on_click_action;

  const nicebutton ({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.text,
    required this.on_click_action,
});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
        onTap: () {
          on_click_action(usernameController.text.trim(), passwordController.text.trim());
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
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class register_now extends StatelessWidget{
  final Function on_click_action;

  const register_now ({
    super.key,
    required this.on_click_action,
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

class simple_text extends StatelessWidget{
  final String text;

  const simple_text ({
    super.key,
    required this.text,
});

  @override
  Widget build(BuildContext context){
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}