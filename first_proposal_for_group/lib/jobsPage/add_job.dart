import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddJob extends StatefulWidget {
  const AddJob({
    Key? key,
  }) : super(key: key);

  @override
  State<AddJob> createState() => AddJobState();
}

class AddJobState extends State<AddJob> {

  final _formKey = GlobalKey<FormState>();
  final _newJob = TextEditingController();
  final _newDescription = TextEditingController();
  final _newLocation = TextEditingController();
  final _newDate = TextEditingController();
  final _newTime = TextEditingController();
  final _newPay = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Job"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _newJob,
                decoration: const InputDecoration(
                  hintText: "Carer name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a job title";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newDescription,
                decoration: const InputDecoration(
                  hintText: "Job Description",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a job description";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newLocation,
                decoration: const InputDecoration(
                  hintText: "Job Location",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a job location";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newDate,
                decoration: const InputDecoration(
                  hintText: "Job Date",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a job date";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newTime,
                decoration: const InputDecoration(
                  hintText: "Job Time",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a job time";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newPay,
                decoration: const InputDecoration(
                  hintText: "Job Pay",
                ),
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
                    FirebaseFirestore.instance.collection("jobs").add({
                      "name": _newJob.text.trim(),
                      "description": _newDescription.text.trim(),
                      "location": _newLocation.text.trim(),
                      "date": _newDate.text.trim(),
                      "time": _newTime.text.trim(),
                      "pay": _newPay.text.trim(),
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}