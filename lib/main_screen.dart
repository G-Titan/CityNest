// main_screen.dart
// ignore_for_file: library_private_types_in_public_api

import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'about_page.dart';
import 'InfinityStones/power.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'media_page.dart';

class MainScreen extends StatefulWidget {
  final Orientation orientation;

  const MainScreen({super.key, required this.orientation});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int page) {
    _pageController.jumpToPage(page);
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    bool shouldShowSettingsButton = Platform.isAndroid ||
        Platform.isIOS; // Show button only on Android and iOS

    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Row(
            children: [
              Icon(Icons.account_balance_wallet, color: Colors.white),
            ],
          ),
        ),
        drawer: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Drawer(
            child: Container(
              color: Colors.purple,
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text(
                      'Portal',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      _navigateToPage(0); // Navigate to HomePage (Portal)
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.music_note, color: Colors.white),
                    title: const Text(
                      'Media hub',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      _navigateToPage(1); // Navigate to Media Hub
                    },
                  ),
                  if (shouldShowSettingsButton)
                    ListTile(
                      leading: const Icon(Icons.settings_suggest_outlined,
                          color: Colors.white),
                      title: const Text(
                        'Settings',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        _navigateToPage(2); // Navigate to Settings
                      },
                    ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: FloatingActionButton(
                      onPressed: () {
                        print("Sun button pressed");
                      },
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.wb_sunny, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            // Handle page change if needed
          },
          children: [
            // Power Stone Page (Dynamic Page)
            const POWER(),

            // Media Hub Page

            const MediaPage(),

            // Settings Page
            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                  // Add more widgets as needed
                ],
              ),
            ),

            // About Page
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text(
                'About',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.purple,
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  initialChildSize: 0.9,
                  maxChildSize: 1,
                  minChildSize: 0.4,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  width: 75,
                                  height: 75,
                                  child: Image.asset(
                                    'assets/animations/clippy.gif',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    prefixIcon: Icon(Icons.image),
                                  ),
                                ),
                              ),
                              Center(
                                child: AnimatedSwitcher(
                                  duration: const Duration(seconds: 3),
                                  child: IconButton(
                                    key: UniqueKey(),
                                    icon: const Icon(Icons.mic),
                                    onPressed: () {
                                      print("Button pressed");
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  // ignore: deprecated_member_use
                                  child: TypewriterAnimatedTextKit(
                                    repeatForever:
                                        false, // Set repeatForever to false
                                    totalRepeatCount:
                                        2, // Set totalRepeatCount to 2
                                    pause: const Duration(milliseconds: 500),
                                    text: const [
                                      "",
                                      "I can read",
                                      "",
                                      "I can see",
                                      "",
                                      "I can hear",
                                      "",
                                      "I am here for you!"
                                    ],
                                    textStyle: const TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          backgroundColor: Colors.white,
          child: Image.asset(
            'assets/animations/AI.gif',
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}
