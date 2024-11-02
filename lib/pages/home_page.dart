import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class HomePage extends StatelessWidget {
  final UserProfile user;
  final VoidCallback onLogout;

  const HomePage({required this.user, required this.onLogout, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, ${user.name}!"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(user: user),
                  ),
                );
              },
              child: const Text('Edit Profile'),
            ),
            ElevatedButton(
              onPressed: onLogout,
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
