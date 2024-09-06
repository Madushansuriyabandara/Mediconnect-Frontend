import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class CreateAccountScaffold extends StatelessWidget {
  const CreateAccountScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(), // Use the background image
          BlurredBox(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const EmailField(),
                  const PasswordField(),
                  const SizedBox(height: 20),
                  LoginButton(),
                  const SizedBox(height: 20),
                  const Text('Or', style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 10),
                  GoogleSignInButton(),
                  const SizedBox(height: 10),
                  FacebookSignInButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

