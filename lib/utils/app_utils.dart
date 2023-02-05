import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
      textColor: Colors.yellow,
    );
  }

  static flushBar(String? _title, String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          title: _title,
          message: message,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
          // flushbarPosition: FlushbarPosition.TOP,
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  static inputFieldNextFocuse(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
