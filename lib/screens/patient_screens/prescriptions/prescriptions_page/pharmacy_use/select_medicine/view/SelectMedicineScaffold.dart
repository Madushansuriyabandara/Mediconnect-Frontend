import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class SelectMedicineScaffold extends StatelessWidget {
  final List<Map<String, dynamic>> medicines = [
    {"name": "Panadine 20mg", "qty": "10 tablets"},
    {"name": "Digene 5mg", "qty": "5 tablets"},
    {"name": "Pantodac 10mg", "qty": "10 tablets"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy Use'),
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          final medicine = medicines[index];
          return MedicineCard(
            medicine: medicine,
            onTap: () {
              Navigator.pushNamed(context, '/set_instructions');
            },
          );
        },
      ),
    );
  }
}
