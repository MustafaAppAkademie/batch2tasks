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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool usePlatformStyle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plattformspezifisches Styling'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Zeige plattformspezifischen Dialog an
                showPlatformDialog(context);
              },
              child: Text('Zeige Dialog'),
              style: usePlatformStyle
                  ? null // Verwende das standardmäßige Flutter-Styling
                  : ElevatedButton.styleFrom(
                      // Verwende plattformspezifisches Styling für Android
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Verwende plattformspezifisches Styling:'),
              Platform.isIOS
                  ? CupertinoSwitch(
                      value: usePlatformStyle,
                      onChanged: (value) {
                        setState(() {
                          usePlatformStyle = value;
                        });
                      },
                    )
                  : Switch(
                      value: usePlatformStyle,
                      onChanged: (value) {
                        setState(() {
                          usePlatformStyle = value;
                        });
                      },
                    ),
            ],
          ),
        ],
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
