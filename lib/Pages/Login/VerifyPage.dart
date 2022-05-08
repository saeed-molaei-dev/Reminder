// ignore_for_file: override_on_non_overriding_member, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, unused_label, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print, unnecessary_string_interpolations, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reminder/Pages/ComingSoon.dart';
import 'package:reminder/MiniClass.dart';
import 'package:reminder/Pages/HomePage.dart';
import 'package:reminder/Provider/MainProvider.dart';
import 'package:reminder/UserInformation/UserInformation.dart';

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:reminder/Login/LoginPage.dart';
import 'package:http/http.dart' as http;

class VerifyPage extends StatefulWidget {
  var phoneNumber;
  VerifyPage({@required this.phoneNumber});
  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  var verifyNumber1 = TextEditingController();
  var verifyNumber2 = TextEditingController();
  var verifyNumber3 = TextEditingController();
  var verifyNumber4 = TextEditingController();
  late FocusNode focusNumber1;
  late FocusNode focusNumber2;
  late FocusNode focusNumber3;
  late FocusNode focusNumber4;
  late FocusNode okBtnFocus;
  bool verifyComplete = false;
  double opacityBtn = 0.5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNumber1 = FocusNode();
    focusNumber2 = FocusNode();
    focusNumber3 = FocusNode();
    focusNumber4 = FocusNode();
    okBtnFocus = FocusNode();
    verifyComplete;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    verifyNumber1.dispose();
    verifyNumber2.dispose();
    verifyNumber3.dispose();
    verifyNumber4.dispose();
    focusNumber1.dispose();
    focusNumber2.dispose();
    focusNumber3.dispose();
    focusNumber4.dispose();
    // okBtnFocus.dispose();

    super.dispose();
  }

  Widget myTextFormField(
      {required TextEditingController verifyNumber,
      required FocusNode focusNumber,
      required FocusNode nextFocusNumber}) {
    // var verifyNumber1 = TextEditingController();
    // var verifyNumber2 = TextEditingController();
    // var verifyNumber3 = TextEditingController();
    // var verifyNumber4 = TextEditingController();
    // late FocusNode focusNumber1;
    // late FocusNode focusNumber2;
    // late FocusNode focusNumber3;
    // late FocusNode focusNumber4;
    // late FocusNode okBtnFocus;
    // bool verifyComplete = false;
    return Container(
      width: 50,
      child: TextFormField(
        onChanged: (value) {
          if (verifyNumber.selection.baseOffset == 1) {
            if (verifyNumber1.text.length == 1 &&
                verifyNumber2.text.length == 1 &&
                verifyNumber3.text.length == 1 &&
                verifyNumber4.text.length == 1) {
              verifyComplete = true;
              setState(() {
                opacityBtn = 1.0;
              });
            }
            nextFocusNumber.requestFocus();
          } else if (verifyNumber.selection.baseOffset == 0) {
            verifyComplete = false;
            setState(() {
              opacityBtn = 0.5;
            });
            focusNumber.requestFocus();
          }
        },
        focusNode: focusNumber,
        autofocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          LengthLimitingTextInputFormatter(1)
        ],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blue,
        ),
        decoration: InputDecoration(
          hintText: '0',
          filled: true,
          fillColor: Colors.blue[50],
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          floatingLabelAlignment: FloatingLabelAlignment.center,
        ),
        controller: verifyNumber,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'کد چهار رقمی ارسال شده به شماره‌ی \n ${MainProvider.phoneNumber} را وارد کنید',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              myTextFormField(
                  verifyNumber: verifyNumber1,
                  focusNumber: focusNumber1,
                  nextFocusNumber: focusNumber2),
              myTextFormField(
                  verifyNumber: verifyNumber2,
                  focusNumber: focusNumber2,
                  nextFocusNumber: focusNumber3),
              myTextFormField(
                  verifyNumber: verifyNumber3,
                  focusNumber: focusNumber3,
                  nextFocusNumber: focusNumber4),
              myTextFormField(
                  verifyNumber: verifyNumber4,
                  focusNumber: focusNumber4,
                  nextFocusNumber: okBtnFocus),
            ],
          ),
          SizedBox(height: 15),
          /*Button*/ Opacity(
            opacity: opacityBtn,
            child: CustomButton(
              title: 'ارسال',
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () async {
                FocusNode:
                okBtnFocus;
                autofocus:
                true;
                if (verifyComplete == true) {
                  LoadingModal.show(context);
                  String verifycode = verifyNumber1.text +
                      verifyNumber2.text +
                      verifyNumber3.text +
                      verifyNumber4.text;

                  var myResult = await http.post(
                    Uri.parse('https://challenge.reval.me/v1/auth/verify'),
                    headers: {"Content-Type": "application/json"},
                    body: json.encode({
                      "username": MainProvider.phoneNumber,
                      "key": MainProvider.phoneToken,
                      "otp": verifycode
                    }),
                  );
                  print('myResult: ${myResult}');
                  print('statusCode: ${myResult.statusCode}');
                  if (myResult.statusCode == 200) {
                    var result = json.decode(utf8.decode(myResult.bodyBytes));
                    MainProvider.verifyToken = result['token'];
                    print(
                        'MainProvider.verifyToken: ${MainProvider.verifyToken}');
                    print('result: ${result}');
                     UserInformation.setverifyToken(
                          context, MainProvider.verifyToken);    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Directionality(
                              textDirection: TextDirection.rtl,
                              child: HomePage())),
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
                } else {
                  setState(() {
                    DialogBottom.show(context);
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
