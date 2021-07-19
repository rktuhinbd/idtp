import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

myAlertDialog(context, title, message) {
  return showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            textStyle: TextStyle(fontSize: 20),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("OK"),
          ),
        ]),
  );
}
