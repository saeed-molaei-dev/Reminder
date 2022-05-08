// ignore_for_file: file_names, unused_import, unnecessary_this, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:reminder/Login/LoginPage.dart';
import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier {
  static late SharedPreferences sharedPreferences;
  bool isInit = false;
  Future<void> init(BuildContext context) async {
    if (!isInit) {
      sharedPreferences = await SharedPreferences.getInstance();
      Login();
      isInit = true;
      this.notifyListeners();
    }
  }

  /*dark*/
  // static Color BlackColor = Color(0xff110011);
  bool IsInit = false;
  static String phoneNumber = '';
  static String phoneToken = '';
  static String verifyToken = '';
}

class LoginVerifyProvider {
  String LoginVerifyUrl;
  var LoginVerifyHeaders;
  Map LoginVerifyBody;
  Widget LoginVerifyNextPage;
  LoginVerifyProvider({
    required this.LoginVerifyUrl,
    required this.LoginVerifyHeaders,
    required this.LoginVerifyBody,
    required this.LoginVerifyNextPage,
  });

  Future createTask(BuildContext context) async {
    var myResult = await http.post(
      Uri.parse(LoginVerifyUrl),
      headers: LoginVerifyHeaders,
      body: json.encode(LoginVerifyBody),
    );

    print('myResult: ${myResult}');
    print('statusCode: ${myResult.statusCode}');
    if (myResult.statusCode == 200) {
      var result = json.decode(utf8.decode(myResult.bodyBytes));
      if (MainProvider.phoneToken.length == 0) {
        MainProvider.phoneToken = result['key'];
      } else {}
      print('MainProvider.token: ${MainProvider.phoneToken}');
      print('result: ${result}');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Directionality(
                textDirection: TextDirection.rtl, child: LoginVerifyNextPage)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'متاسفانه عملیات با خطا مواجه شد!!',
                style: TextStyle(
                  color: Color(0xff3581d7),
                ),
              ),
              Icon(
                Icons.sync_problem_outlined,
                color: Color(0xff3581d7),
              )
            ],
          ),
        ),
      );
    }
  }
}
