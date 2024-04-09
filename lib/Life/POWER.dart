// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:citynest/conf/CoreNav.dart';
import 'package:citynest/settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:citynest/media_page.dart';
import 'package:citynest/about_page.dart';
import 'package:citynest/conf/disndat.dart'; // Assuming this is where login/register logic is

class Power extends StatefulWidget {
  const Power({super.key});

  @override
  _PowerState createState() => _PowerState();
}

class _PowerState extends State<Power> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MediaPage(),
    const AboutPage(),
    const SettingsPage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Godly\'s Touch'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: GoogleFonts.pacifico(
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
        ),
      ),
      drawer: CoreNav(navigateToPage: (index) {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.of(context).pop();
      }),
      body: const PowerPageContent(),
    );
  }
}

class PowerPageContent extends StatefulWidget {
  const PowerPageContent({super.key});

  @override
  _PowerPageContentState createState() => _PowerPageContentState();
}

class _PowerPageContentState extends State<PowerPageContent> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    _checkSignInStatus();
  }

  Future<void> _checkSignInStatus() async {
    var user = FirebaseAuth.instance.currentUser;
    setState(() {
      _isSignedIn = user != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isSignedIn) {
      // User is signed in
      return PageView(
        children: const [
          InfinityGauntlet(),
          MediaPage(),
          AboutPage(),
          SettingsPage(),
        ],
      );
    } else {
      // User is not signed in, show login/register logic from disndat.dart
      return const disndat(); // Replace with actual Widget to show if not signed in
    }
  }
}

class InfinityGauntlet extends StatefulWidget {
  const InfinityGauntlet({super.key});

  @override
  State<InfinityGauntlet> createState() => _InfinityGauntletState();
}

class _InfinityGauntletState extends State<InfinityGauntlet> {
  final String _textResult = '';
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image placeholder
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: Icon(
                Icons.image,
                size: 80,
                color: Colors.grey[700],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Text Recognition Result: $_textResult'),
          ),
          const Spacer(), // Use Spacer to push the input and button to the bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type or speak to the AI',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () => _sendDataToAI(_textController.text),
                  child: const Icon(Icons.send),
                  // Adjust the size if needed
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // Add some space at the bottom
        ],
      ),
    );
  }

  void _sendDataToAI(String input) {
    // Placeholder for logic to send data to AI
    // For now, we'll just display the input in a dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('AI Input'),
        content: Text(input),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
