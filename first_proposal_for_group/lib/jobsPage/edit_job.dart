import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditJob extends StatefulWidget {

  // final String job;
  // final String description;
  // final String location;
  // final String date;
  // final String time;
  // final String pay;
  // final String id;

  const EditJob({
    Key? key,
  }) : super(key: key);

  @override
  State<EditJob> createState() => EditJobState();
}

class EditJobState extends State<EditJob> {

  final _formKey = GlobalKey<FormState>();
  var _newJob = TextEditingController();
  var _newDescription = TextEditingController();
  var _newLocation = TextEditingController();
  var _newDate = TextEditingController();
  var _newTime = TextEditingController();
  var _newPay = TextEditingController();


  @override
  void dispose() {
    _newJob.dispose();
    _newDescription.dispose();
    _newLocation.dispose();
    _newDate.dispose();
    _newTime.dispose();
    _newPay.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // grabs the arguments passed from the jobsPage
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['name']),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _newJob = TextEditingController(text: arguments['name']),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a job title";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newDescription = TextEditingController(text: arguments['description']),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a job description";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newLocation = TextEditingController(text: arguments['location']),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a job location";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newDate = TextEditingController(text: arguments['date']),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a job date";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newTime = TextEditingController(text: arguments['time']),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a job time";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newPay = TextEditingController(text: arguments['pay']),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a job pay";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FirebaseFirestore.instance.collection('jobs').doc(arguments['id']).update({
                      'name': _newJob.text,
                      'description': _newDescription.text,
                      'location': _newLocation.text,
                      'date': _newDate.text,
                      'time': _newTime.text,
                      'pay': _newPay.text,
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}