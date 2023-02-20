import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// void main() {
//   runApp(LoginPage());
// }
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;
//
//   get http => null;
//
//   void _login() async {
//     setState(() {
//       _isLoading = true;
//     });
//     try {
//       final response = await http.post(
//         Uri.parse('http://example.com/login.php'),
//         body: {
//           'username': _usernameController.text,
//           'password': _passwordController.text,
//         },
//       );
//       // Check response status code and handle success or error accordingly
//       if (response.statusCode == 200) {
//         // Navigate to home screen or display success message
//       } else {
//         // Display error message
//       }
//     } catch (e) {
//       // Display error message
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Container(
  //         padding: EdgeInsets.all(16),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               'Login',
  //               style: TextStyle(
  //                 fontSize: 24,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(height: 24),
  //             TextField(
  //               controller: _usernameController,
  //               decoration: InputDecoration(
  //                 labelText: 'Username',
  //                 border: OutlineInputBorder(),
  //               ),
  //             ),
  //             SizedBox(height: 16),
  //             TextField(
  //               controller: _passwordController,
  //               obscureText: true,
  //               decoration: InputDecoration(
  //                 labelText: 'Password',
  //                 border: OutlineInputBorder(),
  //               ),
  //             ),
  //             SizedBox(height: 24),
  //             ElevatedButton(
  //               onPressed: _isLoading ? null : _login,
  //               child: _isLoading ? CircularProgressIndicator() : Text('Login'),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/second': (context) => SecondScreen(),
        '/red': (context) => RedScreen(),
        '/green': (context) => GreenScreen(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;


   String _usernameController = "";
  String _passwordController = "";
  bool _isLoading = false;

  get http => null;

  void _login() async {

    Map<String, String> body = {
      'username': _usernameController,
    };

    Response r = await post(
      Uri.parse('https://7d75-134-220-250-238.eu.ngrok.io/login.php'),
      body: body,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Login Screen'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (input) => _usernameController = input!,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (input) {
                if (input!.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              onSaved: (input) => _passwordController = input!,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                )
            ),
            // TextField(
            // controller: _controller,
            // decoration: const InputDecoration(hintText: 'Enter Title'),
            // ),
            // ElevatedButton(
            // onPressed: () {
            // setState(() {
            // _futureAlbum = createAlbum(_controller.text);
            // });
            // },
            // child: const Text('Create Data'),
            // ),
          ],
        ),
      ),
    );
  }

  // Column(
  // mainAxisAlignment: MainAxisAlignment.center,
  // children: <Widget>[
  // TextField(
  // controller: _controller,
  // decoration: const InputDecoration(hintText: 'Enter Title'),
  // ),
  // ElevatedButton(
  // onPressed: () {
  // setState(() {
  // _futureAlbum = createAlbum(_controller.text);
  // });
  // },
  // child: const Text('Create Data'),
  // ),
  // ],
  // )


  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _login();
      // Use the saved values to authenticate the user
      // Navigator.pushNamed(context, '/second');
    }
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey, title: Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/red');
                },
                child: Text('Red Screen'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/green');
                },
                child: Text('Green Screen'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                )
            ),
          ],
        ),
      ),
    );
  }}


class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Red Screen'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go Back'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            )),
      ),
    );
  }
}


class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Green Screen'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go Back'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            )),
      ),
    );
  }
}