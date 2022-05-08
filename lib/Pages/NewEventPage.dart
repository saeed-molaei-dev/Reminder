// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class NewEventPage extends StatefulWidget {
  @override
  State<NewEventPage> createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 50,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black87,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
          )),
      body: Column(
        children: [
          Container(
            child: Text('fild 1'),
          ),
          Container(
            child: Text('fild 2'),
          ),
          Container(
            child: Text('دکمه ثبت'),
          ),
        ],
      ),
    );
  }
}
