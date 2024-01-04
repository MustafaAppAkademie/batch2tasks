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
      home: PlatformSpecificIcon(),
    );
  }
}

class PlatformSpecificIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoIconWidget() // iOS: CupertinoIcon
          : AndroidIconWidget(), // Android: Material Design Icon
    );
  }
}

class CupertinoIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Icon(CupertinoIcons.heart),
      onPressed: () {},
    );
  }
}

class AndroidIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Aktion für das Material-Design-Icon
      },
      child: Icon(Icons.favorite),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
