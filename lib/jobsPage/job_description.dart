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
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['name']),
      ),
      body: Column(
        children: [
          Text(arguments['description']),
        ],
      ),
    );
  }
}