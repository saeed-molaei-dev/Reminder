// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_is_empty

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reminder/Pages/ComingSoon.dart';
import 'package:reminder/Login/VerifyPage.dart';
import 'package:reminder/MiniClass.dart';
import 'package:reminder/Provider/MainProvider.dart';

import 'dart:async';

import 'package:reminder/UserInformation/UserInformation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var phoneController = TextEditingController();
  bool counterNumber = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'لطفا شماره همراه خود را وارد کنید',
              style: TextStyle(fontSize: 24),
            ),
            /*UserName*/ Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Colors.blue[50],
              ),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.only(top: 4),
                child: TextFormField(
                  validator: (value) {
                    if (!RegExp("(^09[0-9]{9}\$)")
                        .hasMatch(phoneController.text)) {
                      return "شماره صحیح نمی باشد";
                    }
                  },
                  autofocus: true,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11)
                  ],
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decorationColor: Colors.black,
                  ),
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.5)),
                      ),
                      hintText: 'مثال: 09123456789',
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey)),
                  controller: phoneController,
                  onChanged: (value) {
                    setState(() {
                      if ((phoneController.text).length == 11) {
                        counterNumber = true;
                      } else {
                        counterNumber = false;
                      }
                    });
                  },
                ),
              ),
            ),
            /*Button*/ Opacity(
              opacity: counterNumber == true ? 1 : 0.5,
              child: CustomButton(
                title: 'ارسال',
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () async {
                  if (counterNumber == false) {
                    setState(() {
                      DialogBottom.show(context);
                    });
                  } else {
                    MainProvider.phoneNumber = phoneController.text;
                    var myResult = await http.post(
                      Uri.parse('https://challenge.reval.me/v1/auth/login'),
                      headers: {"Content-Type": "application/json"},
                      body: json.encode({"username": MainProvider.phoneNumber}),
                    );

                    print('myResult: ${myResult}');
                    print('statusCode: ${myResult.statusCode}');
                    if (myResult.statusCode == 200) {
                      var result = json.decode(utf8.decode(myResult.bodyBytes));

                      MainProvider.phoneToken = result['key'];

                      UserInformation.setphoneNumber(
                          context, MainProvider.phoneNumber);
                      UserInformation.setphoneToken(context, MainProvider.phoneToken);

                      print('MainProvider.token: ${MainProvider.phoneToken}');
                      print('result: ${result}');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyPage(
                                phoneNumber: MainProvider.phoneNumber)),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
