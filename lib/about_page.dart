// about_page.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (_tapCount < 2) {
              _tapCount++;
            } else {
              // Display developer information on the third tap
              _showDeveloperInfo();
            }
          },
          child: Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/imgs/null.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  void _showDeveloperInfo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Developer Info'),
          content: Column(
            children: [
              Image.asset('assets/imgs/art.jpg', width: 75, height: 75),
              const SizedBox(height: 16),
              const Text('Name: Ghost'),
              const Text('Email: Godlyttn@gmail.com'),
              // Add more information as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
