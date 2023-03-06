// import 'package:collab_ws/jobsPage/addButton.dart';
import 'package:collab_ws/jobsPage/jobTiles.dart';
// import 'package:collab_ws/jobsPage/jobsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:http/http.dart' as http;
// import 'jobsScreen.dart';
import 'alertBox.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {

  List jobs = [
    ["job1", false],
  ];


  void checkJob(bool? value, int index) {
    setState(() {
      jobs[index][1] = value!;
    });
  }


  final _newJob = TextEditingController();

  createNewJob() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyAlertBox(
          controller: _newJob,
          onCancel: cancelJob,
          onSave: saveJob,
        );
      },
    );
  }

  void saveJob() {
    // add new job
    setState(() {
      jobs.add([_newJob.text, false]);
    });
    // clear text field
    _newJob.clear();
    // pop dialog box
    Navigator.of(context).pop();
  }

  cancelJob() {
    // clear text field
    _newJob.clear();
    // pop dialog box
    Navigator.of(context).pop();
    // Future.value(false);
  }

  openJobSetting(int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => cancelJob(),
            child: MyAlertBox(
                controller: _newJob,
                onCancel: cancelJob,
                onSave: () => saveExistingJob(index)
            ),
          );
        }
        );
  }

  deleteJobTile(int index) {
    setState(() {
      jobs.removeAt(index);
    });
  }

  void saveExistingJob(int index) {
    setState(() {
      jobs[index][0] = _newJob.text;
    });
    _newJob.clear();
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
            "Home",
            style: TextStyle(color: Colors.black)
        ),
        actions: [
          IconButton(
            onPressed: () {
              createNewJob();
            },
            icon: const Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/jobs');
        //     },
        //     icon: Icon(Icons.search),
        //   ),
        // ],
      ),
      body:
      SlidableAutoCloseBehavior( // added so that a single tile stays open at a time
        child:
      ListView.builder(
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            return JobTiles(
              name: jobs[index][0],
              value: jobs[index][1],
              onClickAction: (value) => checkJob(value, index),
              settingsTap: (context) => openJobSetting(index),
              deleteTap: (context) => deleteJobTile(index),
            );
          }
      ),
      ),
      );
  }
}

