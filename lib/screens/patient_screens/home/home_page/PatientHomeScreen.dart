import 'dart:convert'; // Import JSON decoding.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the HTTP package.

import '../../../../themes/appointmentStatusColors.dart';
import '../../../../themes/bottomNavBar/patientBottomNavBar.dart';
import '../../../../themes/switchUser.dart';
import '../appointment_details/AppointmentDetailsScreen.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key}); // Replace with dynamic user email

  @override
  _PatientHomeScreenState createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  final String userEmail = "johndoe@example.com";
  List<dynamic> appointments = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://gist.githubusercontent.com/PasinduNimesha/418cd90da2753629286358905eaf5c59/raw/332251635fadc8284f9060251cd82571b06a6392/appointments.json'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          appointments = data['appointments'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.switch_account),
            onPressed: () {
              switchUser(context);
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // Show a loading indicator while fetching data
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(),
            ),
            const SizedBox(height: 20),
            const Text(
              'My Appointments',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final appointment = appointments[index];
                  return AppointmentButton(
                    color: getAppointmentStatusColor(appointment['appointmentStatus']),
                    text: '${appointment['appointmentName']} - ${appointment['doctorName']}',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentDetailsScreen(
                            appointmentName: appointment['appointmentName'],
                            doctorName: appointment['doctorName'],
                            specialty: appointment['specialty'],
                            appointmentTime: appointment['appointmentTime'],
                            appointmentDate: appointment['appointmentDate'],
                            location: appointment['location'],
                            appointmentNumber: appointment['appointmentNumber'],
                            currentNumber: appointment['currentNumber'],
                            turnTime: appointment['turnTime'],
                            appointmentStatus: appointment['appointmentStatus'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PatientBottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }
}

class AppointmentButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const AppointmentButton({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
