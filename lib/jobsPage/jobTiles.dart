import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class JobTiles extends StatelessWidget{
  final String name;
  final bool value;
  final Function(bool?)? onClickAction;
  final Function(BuildContext)? settingsTap;
  final Function(BuildContext)? deleteTap;

  const JobTiles ({
    super.key,
    required this.name,
    required this.value,
    required this.onClickAction,
    required this.settingsTap,
    required this.deleteTap,
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            // settings
            SlidableAction(
              onPressed: settingsTap,
              backgroundColor: Colors.black,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(12),
            ),

            // delete
            SlidableAction(
              onPressed: deleteTap,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children:
            [
              Checkbox(
                value: value,
                onChanged: onClickAction,
              ),
              Text(name),
            ],
          ),
        ),
      ),
    );
  }
}