import 'package:flutter/material.dart';

class JobsScreen extends StatelessWidget{
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children:
          [
            Checkbox(value: false, onChanged: (value) {  },),
            Text("test"),
          ],
      ),
    ),
    );
  }

  
}