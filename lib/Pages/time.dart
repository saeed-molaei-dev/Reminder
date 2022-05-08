// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    Jalali j1 = now.toJalali();
    print(' $j1');
    return Scaffold(
      body: Column(
        children: [
          Text(now.toString()),
          Text(date.toString()),
          Text(
            '_timeString'.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('  ${j1.weekDay}'),
          Text(
            '  ${j1.second}',
            style: TextStyle(
              fontSize: 75,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
