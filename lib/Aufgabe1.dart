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
        title: Text('Batch 2 - Aufgabe 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Material Design Button
            Platform.isIOS
                ? CupertinoButton(
                    child: Text('Cupertino Button'),
                    onPressed: () {
                      // Aktion für den Cupertino-Button
                    },
                    color: CupertinoColors.systemBlue,
                  )
                : ElevatedButton(
                    onPressed: () {
                      // Aktion für den ElevatedButton
                    },
                    child: Text('Elevated Button'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
