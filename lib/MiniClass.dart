// ignore_for_file: file_names, unused_import, prefer_const_constructors, unnecessary_new, sized_box_for_whitespace, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reminder/Pages/ComingSoon.dart';

/*CustomButton*/
class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final void Function() onPressed;

  CustomButton({
    required this.title,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: color)))),
            onPressed: () => onPressed(),
            child: Text(
              title,
              style: TextStyle(color: textColor, fontSize: 20),
            )),
      ),
    ]);
  }
}

/*LoadingModal*/
class LoadingModal {
  static void show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      builder: (context) => new AlertDialog(
        content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 32,
                width: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 5.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'لطفا کمی منتظر بمانید\nدر حال ارتباط با سرور',
                style: TextStyle(color: Colors.black),
              ),
            ]),
      ),
      context: context,
    );
  }
}

class DialogBottom {
  static void show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      builder: (context) => new AlertDialog(
        content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'شماره وارد شده اشتباه است\nلطفا دوباره تلاش کنید ',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    'تایید',
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ]),
      ),
      context: context,
    );
  }
}
