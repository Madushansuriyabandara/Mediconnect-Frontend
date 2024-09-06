import 'package:flutter/material.dart';
import 'package:mediconnect/screens/common_screens/register/patient_registration/PatientRegistrationForm.dart';
import 'package:mediconnect/screens/common_screens/register/doctor_registration/';

class RoleTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String onPressedRoute;

  const RoleTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressedRoute,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressedRoute == 'doctor_registration') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DoctorRegistrationScreen()),
          );
        } else if (onPressedRoute == 'patient_registration') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PatientRegistrationForm()),
          );
        }
      },
      child: Column(
        children: [
          Icon(icon, size: 100),
          Text(label),
        ],
      ),
    );
  }
}
