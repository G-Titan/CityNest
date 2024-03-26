// main.dart
import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfinityStones',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OrientationBuilder(
        builder: (context, orientation) {
          return MainScreen(orientation: orientation);
        },
      ),
    );
  }
}
