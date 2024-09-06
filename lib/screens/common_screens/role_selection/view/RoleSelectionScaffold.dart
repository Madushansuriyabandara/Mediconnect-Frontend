import 'package:flutter/material.dart';
import '../../widgets/widgets.dart'; // Import the widgets file to export RoleTile

class RoleSelectionScaffold extends StatelessWidget {
  const RoleSelectionScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
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
                children: const [
                  RoleTile(
                    icon: Icons.local_hospital,
                    label: 'Doctor',
                    onPressedRoute: 'doctor_registration',
                  ),
                  SizedBox(width: 20),
                  RoleTile(
                    icon: Icons.person,
                    label: 'Patient',
                    onPressedRoute: 'patient_registration',
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
