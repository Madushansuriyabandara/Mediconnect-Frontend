import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final Map<String, dynamic> medicine;
  final VoidCallback onTap;

  const MedicineCard({
    Key? key,
    required this.medicine,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(medicine['name']),
      subtitle: Text(medicine['qty']),
      onTap: onTap,
    );
  }
}
