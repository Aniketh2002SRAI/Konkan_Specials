import 'package:flutter/material.dart';

Future<void> showCircularProgressIndicator({required BuildContext context}) async{
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
