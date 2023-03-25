import 'package:flutter/material.dart';

class JobDescription extends StatefulWidget {

  const JobDescription({
    Key? key,
  }) : super(key: key);

  @override
  State<JobDescription> createState() => JobDescriptionState();
}

class JobDescriptionState extends State<JobDescription> {

  @override
  Widget build(BuildContext context) {

    // grabs the arguments passed from the jobsPage
    final arguments = ((ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map)['jobs'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(arguments['name']),
      ),
      body: Column(
        children: [
          Container (
              padding: EdgeInsets.all(10),
              child:
              Text(arguments['time'],
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              )
          ),
          Container (
            padding: EdgeInsets.all(10),
              child:
              Text(arguments['description'],
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              )
          ),
        ],
      ),
    );
  }
}