import 'package:flutter/material.dart';
import 'package:mediconnect/screens/common_screens/create_account & login/create_account/create_account.dart'; // Import the RegisterScreen

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
        );
      },
      child: const Text(
        'Create an Account',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
