import 'package:flutter/material.dart';
import 'package:mediconnect/screens/patient_screens/PatientRegistrationScreen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // This function will be triggered when the back button is pressed
        Navigator.pop(context); // Redirect to the previous screen
        return false; // Prevents default back button behavior
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'I am a,',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to doctor registration form
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Scaffold()),
                      );
                    },
                    child: const Column(
                      children: [
                        Icon(Icons.local_hospital, size: 100),
                        Text('Doctor'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to patient registration form
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PatientRegistrationForm()),
                      );
                    },
                    child: const Column(
                      children: [
                        Icon(Icons.person, size: 100),
                        Text('Patient'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}