import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  Future<void> _checkLoginCredentials(
      BuildContext context, String email, String password) async {
    final url = Uri.parse('http://192.168.8.124:8000/users/login/'); // Update to your login API URL
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Login successful
        Navigator.pushNamed(context, '/home');
      } else if (response.statusCode == 401) {
        _showErrorDialog(context, 'Incorrect email or password.');
      } else {
        _showErrorDialog(context, 'Something went wrong. Try again.');
      }
    } catch (error) {
      _showErrorDialog(context, 'Error connecting to the server.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();
        _checkLoginCredentials(context, email, password);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
      ),
      child: const Text('Login'),
    );
  }
}
