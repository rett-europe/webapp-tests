import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final VoidCallback onLogin;

  const LandingPage({required this.onLogin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: onLogin,
          child: const Text('Login'),
        ),
      ),
    );
  }
}
