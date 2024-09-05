import 'package:flutter/material.dart';

import '../../../../themes/bottomNavBar/patientBottomNavBar.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Medical Records'),
          bottom: const TabBar(
            indicatorColor: Colors
                .blue, // The color of the underline below the selected tab
            labelColor:
            Colors.blue, // The color of the text of the selected tab
            unselectedLabelColor:
            Colors.grey, // The color of the text of the unselected tabs
            tabs: [
              Tab(text: 'My Prescriptions'),
              Tab(text: 'My Reports'),
            ],
          ),
          backgroundColor: Colors.white, // Background color of the AppBar
        ),
        body: TabBarView(
          children: [
            MyPrescriptionsPage(),
            MyReportsPage(),
          ],
        ),
        bottomNavigationBar: PatientBottomNavBar(
          currentIndex: 2,
          onTap: (index) {
            // Handle bottom navigation tap
          },
        ),
      ),
    );
  }
}

class MyPrescriptionsPage extends StatelessWidget {
  final List<Map<String, dynamic>> prescriptions = [
    {
      'date': 'February 15, 2024',
      'doctor': 'Dr. John Doe (Cardiac Surgeon)',
      'medications': [
        'Panadine 20mg - 10 tablets',
        'Digene 5mg - 5 tablets',
        'Pantodac 10mg - 10 tablets',
      ],
      'progress': 60,
      'keywords': ['Gastritis'],
    },
    {
      'date': 'January 15, 2024',
      'doctor': 'Dr. Will Churchill (Orthopedic Surgeon)',
      'medications': [
        'Panadine 20mg - 10 tablets',
        'Digene 5mg - 5 tablets',
        'Pantodac 10mg - 10 tablets',
      ],
      'progress': 90,
      'keywords': ['Gastritis'],
    },
    {
      'date': 'December 23, 2023',
      'doctor': 'Dr. Will Churchill (Orthopedic Surgeon)',
      'medications': [
        'Panadine 20mg - 10 tablets',
        'Digene 5mg - 5 tablets',
        'Pantodac 10mg - 10 tablets',
      ],
      'progress': 100,
      'keywords': ['Gastritis'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: prescriptions.length,
      itemBuilder: (context, index) {
        final prescription = prescriptions[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prescription['date'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  prescription['doctor'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                ...prescription['medications'].map<Widget>((medication) {
                  return Text(
                    medication,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  );
                }).toList(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: prescription['progress'] / 100,
                        backgroundColor: Colors.grey[300],
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('${prescription['progress']}%'),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8.0,
                  children: prescription['keywords'].map<Widget>((keyword) {
                    return Chip(
                      label: Text(keyword),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyReportsPage extends StatelessWidget {
  const MyReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is the My Reports page'),
    );
  }
}
