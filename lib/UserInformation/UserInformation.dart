// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:reminder/Provider/MainProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInformation {
  static setphoneNumber(BuildContext context, String mobile) async {
    await MainProvider.sharedPreferences.setString('mobile', mobile);
  }

  static String? getphoneNumber(BuildContext context) {
    return MainProvider.sharedPreferences.getString('mobile');
  }

  static setphoneToken(BuildContext context, String token) async {
    await MainProvider.sharedPreferences.setString('token', token);
  }

  static String? getphoneToken(BuildContext context) {
    return MainProvider.sharedPreferences.getString('token');
  }

  static setverifyToken(BuildContext context, String mobile) async {
    await MainProvider.sharedPreferences.setString('mobile', mobile);
  }

  static String? getverifyToken(BuildContext context) {
    return MainProvider.sharedPreferences.getString('mobile');
  }
}
