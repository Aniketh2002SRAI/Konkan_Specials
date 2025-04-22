import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> showCircularProgressIndicator(
    {required BuildContext context}) async {
  return await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const SimpleDialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator.adaptive(),
          )
        ],
      );
    },
  );
}

void hideProgressIndicator({required BuildContext context}) {
  Navigator.pop(context);
}

void showErrorSnackBar(
    {required BuildContext context, required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM, // You can also use CENTER or TOP
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}
