import 'package:flutter/material.dart';

class SimplestClassTemplate extends StatefulWidget {
  const SimplestClassTemplate({Key? key}) : super(key: key);

  @override
  State<SimplestClassTemplate> createState() => _SimplestClassTemplateState();
}

class _SimplestClassTemplateState extends State<SimplestClassTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
