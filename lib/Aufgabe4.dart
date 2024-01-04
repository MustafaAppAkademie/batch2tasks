import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plattformspezifische Dialoge'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Zeige plattformspezifischen Dialog an
            showPlatformDialog(context);
          },
          child: Text('Zeige Dialog'),
        ),
      ),
    );
  }

  void showPlatformDialog(BuildContext context) {
    if (Platform.isIOS) {
      // iOS-Dialog
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('iOS Dialog'),
            content: Text('Das ist ein iOS Dialog.'),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (Platform.isAndroid) {
      // Android-Dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Android Dialog'),
            content: Text('Das ist ein Android Dialog.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
