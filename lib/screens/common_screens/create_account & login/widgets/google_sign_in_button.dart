import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleSignInButton extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Get the Google authentication token
        final googleAuth = await googleUser.authentication;

        // Send the Google token to your backend for verification
        final response = await http.post(
          Uri.parse('https://your-backend-api.com/api/google-login/'), // Django backend endpoint
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'token': googleAuth.idToken, // Send the Google ID token
          }),
        );

        if (response.statusCode == 200) {
          // Successfully logged in
          print('Google login successful');
        } else {
          _showErrorMessage('Google login failed');
        }
      }
    } catch (error) {
      _showErrorMessage('Google login failed');
    }
  }

  void _showErrorMessage(String message) {
    // You can replace this with SnackBar or any other method
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.email),
      label: const Text('Sign In with Google'),
      onPressed: _handleGoogleSignIn,
    );
  }
}
