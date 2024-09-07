import 'package:flutter/material.dart';

class VisitingHospitalField extends StatelessWidget {
  final TextEditingController hospitalController = TextEditingController();
  TimeOfDay? visitingTime;
  final List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final Map<String, bool> daySelected = {
    'Mon': false,
    'Tue': false,
    'Wed': false,
    'Thu': false,
    'Fri': false,
    'Sat': false,
    'Sun': false,
  };

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      visitingTime = pickedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TextFormField(
            controller: hospitalController,
            decoration: const InputDecoration(labelText: 'Visiting Hospital'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the hospital name';
              }
              return null;
            },
          ),
          Row(
            children: daysOfWeek.map((day) {
              return Row(
                children: [
                  Checkbox(
                    value: daySelected[day],
                    onChanged: (bool? value) {
                      daySelected[day] = value!;
                    },
                  ),
                  Text(day),
                ],
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () => _pickTime(context),
            child: Text(visitingTime != null ? visitingTime!.format(context) : 'Pick Time'),
          ),
        ],
      ),
    );
  }
}
