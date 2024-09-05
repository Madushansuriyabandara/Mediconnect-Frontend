import 'package:flutter/material.dart';

import 'RoleSelectionScreen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Send verification email and redirect to role selection
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RoleSelectionScreen()),
                );
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            const Text('Or'),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.email),
              label: const Text('Sign Up with Google'),
              onPressed: () {
                // Handle Google Sign up
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.facebook),
              label: const Text('Sign Up with Facebook'),
              onPressed: () {
                // Handle Facebook Sign up
              },
            ),
          ],
        ),
      ),
    );
  }
}