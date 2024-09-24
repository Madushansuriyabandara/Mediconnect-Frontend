import 'package:flutter/material.dart';
import 'package:mediconnect/screens/common_screens/create_account%20&%20login/create_account/widgets/CreateAccountButton.dart';
import 'package:mediconnect/screens/common_screens/create_account%20&%20login/widgets/facebook_sign_in_button.dart';
import '../../widgets/widgets.dart';

class CreateAccountScaffold extends StatefulWidget {
  const CreateAccountScaffold({super.key});

  @override
  State<CreateAccountScaffold> createState() => _CreateAccountScaffoldState();
}

class _CreateAccountScaffoldState extends State<CreateAccountScaffold> {
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
                  CreateAccountButton(),
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

