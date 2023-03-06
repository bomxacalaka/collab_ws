// import 'package:collab_ws/jobsPage/addButton.dart';
import 'dart:convert';
import 'dart:async';
import 'package:collab_ws/jobsPage/jobTiles.dart';
// import 'package:collab_ws/jobsPage/jobsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;
// import 'jobsScreen.dart';
import 'alertBox.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {

  // will grab the jobs from the database and store them in this list of maps
  List jobs = [];
  getJobs() async {
    List jobsL = [];
    final jobs = await FirebaseFirestore.instance.collection('jobs').get();
    for (var job in jobs.docs) {
      // add job to list
      Map<String, dynamic> jobData = job.data();
      jobData['id'] = job.id;
      jobsL.add(jobData);
      jobsL.sort((a, b) => a['name'].compareTo(b['name']));
    }
    return jobsL;
  }


  populate(){
    getJobs().then((value) {
      setState(() {
        jobs = value;
      });
    });
  }


  Timer? mytimer;
  @override
  void initState() {
    mytimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //code to run on every 5 seconds
      populate();
    });
    super.initState();
  }


  @override
  dispose() {
    jobs.clear();
    mytimer?.cancel();
    super.dispose();
  }


  createNewJob() {
    Navigator.pushNamed(context, '/add_job');
  }


  openJobSetting(int index) {
    Navigator.pushNamed(context, '/edit_job', arguments: jobs[index]);
  }


  deleteJobTile(int index) async {
    FirebaseFirestore.instance.collection('jobs').doc(jobs[index]['id']).delete();
    setState(() {
      jobs.removeAt(index);
    });
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
              name: jobs[index]['name'],
              description: jobs[index]['description'],
              // value: jobs[index][2],
              // onClickAction: (value) => checkJob(value, index),
              settingsTap: (context) => openJobSetting(index),
              deleteTap: (context) => deleteJobTile(index),
            );
          }
      ),
      ),
      );
  }
}

