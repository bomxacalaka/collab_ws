import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {

  const AddButton({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Create a new job"),
              content: TextField(),
            );
          },
        );
      },
      child: const Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}