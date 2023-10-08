// dynamic_page.dart
import 'package:flutter/material.dart';

class DynamicPage extends StatelessWidget {
  final List<Widget> childPages; // Add this line

  DynamicPage({Key? key, required this.childPages}) : super(key: key); // Add this line

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dynamic Page',
            style: TextStyle(color: Colors.white),
          ),
          // Add more widgets as needed
          ...childPages, // Add this line to include the child pages
        ],
      ),
    );
  }
}
