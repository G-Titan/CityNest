// ignore_for_file: library_private_types_in_public_api
import 'package:citynest/conf/disndat.dart';
import 'package:flutter/material.dart';
import 'package:citynest/conf/CoreNav.dart';
import 'package:citynest/settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:citynest/media_page.dart';
import 'package:citynest/about_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // ignore: unused_field
  int _selectedIndex = 0;

  // List of pages to navigate through
  final List<Widget> _pages = [
    const disndat(),
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
          // Example using Pacifico, a cursive font
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
        ),
      ),
      drawer: CoreNav(navigateToPage: (index) {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.of(context).pop(); // Close the drawer after navigation
      }),
      body: PageView(
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
    );
  }
}
