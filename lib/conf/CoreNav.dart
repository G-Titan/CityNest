import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:citynest/conf/CloudSync.dart';

class CoreNav extends StatelessWidget {
  final Function(int) navigateToPage;

  CoreNav({super.key, required this.navigateToPage});

  // This boolean value is a placeholder. Replace it with your actual logic to check if the user is signed in.
  // For example, using FirebaseAuth: FirebaseAuth.instance.currentUser != null
  final bool isUserSignedIn = FirebaseAuth.instance.currentUser != null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.purple,
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title:
                  const Text('Portal', style: TextStyle(color: Colors.white)),
              onTap: () => navigateToPage(0),
            ),
            ListTile(
              leading: const Icon(Icons.music_note, color: Colors.white),
              title: const Text('Media', style: TextStyle(color: Colors.white)),
              onTap: () => navigateToPage(1),
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title:
                  const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () => navigateToPage(2),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.white),
              title: const Text('Help', style: TextStyle(color: Colors.white)),
              onTap: () => navigateToPage(3),
            ),
            // Conditional display of the Logout button
            if (isUserSignedIn)
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title:
                    const Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () => CloudSync.signOut(context),
              ),
            Expanded(child: Container()),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: FloatingActionButton(
                onPressed: () {
                  // Placeholder for action, e.g., switching themes
                },
                backgroundColor: Colors.white,
                child: const Icon(Icons.wb_sunny, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
