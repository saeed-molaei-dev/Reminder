// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reminder/Pages/Login/Splash.dart';

class ComingSoon extends StatefulWidget {
  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 50,
            color: Colors.black,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Directionality(
                    textDirection: TextDirection.rtl, child: Splash())),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.pink, //change your color here
        ),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'این صفحه\nبه زودی\nدر دسترس\nخواهد بود\n:)',
              style: TextStyle(fontSize: 25, color: Colors.black),
            )),
      ),
    );
  }
}
