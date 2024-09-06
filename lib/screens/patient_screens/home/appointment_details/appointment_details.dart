import 'package:flutter/material.dart';
import 'view/view.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final String appointmentName;
  final String doctorName;
  final String specialty;
  final String appointmentTime;
  final String appointmentDate;
  final String location;
  final int appointmentNumber;
  final int currentNumber;
  final String turnTime;
  final String appointmentStatus;

  const AppointmentDetailsScreen({
    super.key,
    required this.appointmentName,
    required this.doctorName,
    required this.specialty,
    required this.appointmentTime,
    required this.appointmentDate,
    required this.location,
    required this.appointmentNumber,
    required this.currentNumber,
    required this.turnTime,
    required this.appointmentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return AppointmentDetailsScaffold(
      appointmentName: appointmentName,
      doctorName: doctorName,
      specialty: specialty,
      appointmentTime: appointmentTime,
      appointmentDate: appointmentDate,
      location: location,
      appointmentNumber: appointmentNumber,
      currentNumber: currentNumber,
      turnTime: turnTime,
      appointmentStatus: appointmentStatus,
    );
  }
}
