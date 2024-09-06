import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FacebookSignInButton extends StatelessWidget {
  Future<void> _handleFacebookLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // Get the Facebook access token
        final accessToken = result.accessToken;

        // Send the Facebook token to your backend for verification
        final response = await http.post(
          Uri.parse('https://your-backend-api.com/api/facebook-login/'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'token': accessToken?.token, // Send the Facebook access token
          }),
        );

        if (response.statusCode == 200) {
          // Successfully logged in
          print('Facebook login successful');
        } else {
          _showErrorMessage('Facebook login failed');
        }
      } else {
        _showErrorMessage('Facebook login failed');
      }
    } catch (error) {
      _showErrorMessage('Facebook login failed');
    }
  }

  void _showErrorMessage(String message) {
    // You can replace this with SnackBar or any other method
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.facebook),
      label: const Text('Sign In with Facebook'),
      onPressed: _handleFacebookLogin,
    );
  }
}

extension on AccessToken? {
  get token => null;
}
