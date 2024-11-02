import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import '../widgets/user_widget.dart';

class ProfilePage extends StatelessWidget {
  final UserProfile user;

  const ProfilePage({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UserWidget(user: user),
      ),
    );
  }
}
