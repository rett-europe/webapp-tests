import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final VoidCallback onLogin;

  const LandingPage({required this.onLogin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine layout adjustments based on screen width
    final isDesktop = screenWidth > 600; // Assuming 600px+ as desktop width

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isDesktop ? 500 : screenWidth * 0.8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App Logo or Image
                Image.asset(
                  'assets/images/logo.png',
                  height: isDesktop ? 150 : 100, // Larger on desktop, smaller on mobile
                ),
                const SizedBox(height: 20),

                // Title
                const Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                // Subtitle
                Text(
                  "Rett Syndrome Patient Registry. Please log in to continue.",
                  style: TextStyle(
                    fontSize: isDesktop ? 18 : 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Login Button
                ElevatedButton(
                  onPressed: onLogin,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(
                        horizontal: isDesktop ? 60 : 50,
                        vertical: isDesktop ? 20 : 15,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isDesktop ? 20 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Optional Footer
                const SizedBox(height: 60),
                Text(
                  "Join the registry, shape the cure",
                  style: TextStyle(
                    fontSize: isDesktop ? 16 : 14,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
