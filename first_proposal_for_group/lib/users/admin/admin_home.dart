import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

//TODO: will display a list of jobs and allow the admin to edit/add/delete jobs


class _AdminHomeState extends State<AdminHome> {

  addBtn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/addJob');
      },
      style: ElevatedButton.styleFrom(
        // backgroundColor: Colors.blue,
        minimumSize: const Size(300, 70),
      ),

      child: const Text('Add Job')
    );
  }

  editBtn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/editJob');
      },
      style: ElevatedButton.styleFrom(
        // backgroundColor: Colors.blue,
        minimumSize: const Size(300, 70),
      ),

      child: const Text('Edit Job')
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
