import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'components.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  checkLocalLogin() async {
    final prefs = await SharedPreferences.getInstance();
    // check if user is logged in
    if (prefs.getString('username2') != null) {
      // if logged in, go to home page
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }else {
      // if not logged in, go to login page
      print("not logged in");
      return null;
    }
  }


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
      /* Possible server responses:
      Password is correct
      Password is incorrect
      User does not exist
       */
      _postResponse = response.body.substring(0, 19);
    });

    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    // if the password is correct,
    // navigate to the home page
    // and remove the login page from the stack
    // so that the user cannot go back to the login page
    if(response.body == "Password is correct"){
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      // Save an String value to 'action' key.
      await prefs.setString('username', "test69123");
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
                    // checkLocalLogin(),
                    const SizedBox(height: 20),

                    const SimpleText(
                        text: "SPEC5"
                    ),

                    const SizedBox(height: 30),

                    TextFieldHere(
                      text: "Email",
                      controller: _usernameController,
                      obscureIt: false,
                    ), const SizedBox(height: 15,),

                    TextFieldHere(
                      text: "Password",
                      controller: _passwordController,
                      obscureIt: true,
                    ), const SizedBox(height: 15,),

                    NiceButton(
                        usernameController: _usernameController,
                        passwordController: _passwordController,
                        text: "Login",
                        onClickAction: login
                    ), const SizedBox(height: 15,),

                    RegisterNow(
                        onClickAction: () => Navigator.pushNamed(context, '/register')
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


