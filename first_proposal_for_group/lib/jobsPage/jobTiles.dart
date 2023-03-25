import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class JobTiles extends StatelessWidget{
  final Function(BuildContext)? settingsTap;
  final Function(BuildContext)? deleteTap;
  final Map<String, dynamic> jobs;

  const JobTiles ({
    super.key,
    required this.settingsTap,
    required this.deleteTap,
    required this.jobs,
  });

  @override
  Widget build(BuildContext context){
    return MaterialButton(
      onPressed: (){
        Navigator.pushNamed(context, '/job_description', arguments: {
          'jobs': jobs,
        });},
      padding: const EdgeInsets.all(0.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            // settings
            SlidableAction(
              onPressed: settingsTap,
              backgroundColor: Colors.black,
              icon: Icons.settings,
              // borderRadius: BorderRadius.circular(12),
            ),

            // delete
            SlidableAction(
              onPressed: deleteTap,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              // borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children:
            [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    jobs['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                // padding: EdgeInsets.all(4.0),
                color: Colors.white,
                // width: 200.0,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: StrutStyle(fontSize: 12.0),
                        text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            text: jobs['date']),
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              // padding: EdgeInsets.all(4.0),
              color: Colors.white,
              // width: 200.0,
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      strutStyle: StrutStyle(fontSize: 12.0),
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: jobs['description']),
                    ),
                  ),
                ],
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}