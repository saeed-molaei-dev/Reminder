// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, missing_required_param

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder/Pages/ComingSoon.dart';
import 'package:reminder/Login/LoginPage.dart';
import 'package:reminder/Login/VerifyPage.dart';
import 'package:reminder/Pages/HomePage.dart';
import 'package:reminder/Pages/Login/Splash.dart';
import 'package:reminder/Pages/NewEventPage.dart';
import 'package:reminder/Provider/MainProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        )
      ],
      child: Riminder(),
    ),
  );
}

class Riminder extends StatefulWidget {
  @override
  _RiminderState createState() => _RiminderState();
}

class _RiminderState extends State<Riminder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tik Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'BKoodak',
        primaryColor: Colors.black,
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Splash(),
        // child: NewEventPage(),
      ), /*finaly*/
    );
  }
}
