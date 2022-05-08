// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder/Pages/ComingSoon.dart';
import 'package:reminder/Login/LoginPage.dart';
import 'package:reminder/Pages/HomePage.dart';
import 'package:reminder/Provider/MainProvider.dart';
import 'package:reminder/UserInformation/UserInformation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;
  startTime() {
    var _duration = Duration(milliseconds: 1000);
    return Timer(_duration, navigationPage);
  }

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  navigationPage() {
    if (UserInformation.getphoneNumber(context) != null &&
        UserInformation.getphoneNumber(context).toString().isNotEmpty &&
        UserInformation.getphoneToken(context) != null &&
        UserInformation.getphoneToken(context).toString().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Directionality(
                textDirection: TextDirection.rtl, child: HomePage());
          },
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Directionality(
                textDirection: TextDirection.rtl, child: Login());
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, mainProvider, _) {
      mainProvider.init(context);
      return Scaffold(
        backgroundColor: Color(0xffdce2f5),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      child: FlutterLogo(size: 50),
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            ]),
          ],
        ),
      );
    });
  }

  CheckLogin() async {
    SharedPreferences userInfo = await SharedPreferences.getInstance();
    String userInfoToken = userInfo.getString('userInfoToken') ?? '';
    if (userInfoToken == '') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Directionality(
                textDirection: TextDirection.rtl, child: Login());
          },
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Directionality(
                textDirection: TextDirection.rtl, child: HomePage());
          },
        ),
      );
    }
  }
}
