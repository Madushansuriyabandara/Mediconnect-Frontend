import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class LoginScaffold extends StatelessWidget {
  const LoginScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(), // Use the background image
          Center(
            child: BlurredBox(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Reduce the box size based on content
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
                    const SizedBox(height: 20),
                    const Text('Do not have an account?', style: TextStyle(color: Colors.black)),
                    CreateAccountButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
