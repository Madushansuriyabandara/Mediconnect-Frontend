import 'package:flutter/material.dart';
import 'package:mediconnect/screens/RegisterScreen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/get_started_image.jpg',
              fit: BoxFit.cover, // Make image cover the entire screen
            ),
          ),
          // Semi-transparent overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.65), // Reduce opacity to darken the image
            ),
          ),
          // Foreground content
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent, // Make AppBar transparent
                elevation: 0, // Remove shadow
                title: const Text('Welcome', style: TextStyle(color: Colors.white)), // White text for contrast
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'MediConnect',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color for contrast
                        ),
                      ),
                      const Text(
                        'Your Healthcare Companion',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white, // Text color for contrast
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          // Check if it's the first run, if yes go to Register, otherwise to Home
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}