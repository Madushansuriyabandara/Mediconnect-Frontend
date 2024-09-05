import 'package:flutter/material.dart';

import 'home/home_page/PatientHomeScreen.dart';

class PatientRegistrationForm extends StatefulWidget {
  const PatientRegistrationForm({super.key});

  @override
  _PatientRegistrationFormState createState() => _PatientRegistrationFormState();
}

class _PatientRegistrationFormState extends State<PatientRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _otherNamesController = TextEditingController();
  final _streetNoController = TextEditingController();
  final _streetNameController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _nicController = TextEditingController();
  final _birthdayController = TextEditingController();

  // Variables for dropdowns and time pickers
  String? _selectedGender;
  TimeOfDay? _breakfastTime;
  TimeOfDay? _lunchTime;
  TimeOfDay? _dinnerTime;

  // Gender options
  final List<String> _genders = ['Male', 'Female', 'Other'];

  // NIC Validation Logic
  String? _validateNIC(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your NIC';
    }

    // Check if the NIC is 10 or 12 characters long
    if (value.length == 10) {
      // Validate the format for old NICs (e.g., 123456789V or 123456789X)
      if (RegExp(r'^\d{9}[VXvx]$').hasMatch(value)) {
        return null; // Valid NIC
      } else {
        return 'Invalid NIC format. Should be 9 digits followed by V or X.';
      }
    } else if (value.length == 12) {
      // Validate the format for new NICs (e.g., 200123456789)
      if (RegExp(r'^\d{12}$').hasMatch(value)) {
        return null; // Valid NIC
      } else {
        return 'Invalid NIC format. Should be 12 digits.';
      }
    } else {
      return 'NIC should be either 10 or 12 characters long.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Name fields in light blue box
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _firstNameController,
                              decoration: const InputDecoration(labelText: 'First name'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: _lastNameController,
                              decoration: const InputDecoration(labelText: 'Last name'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _otherNamesController,
                        decoration: const InputDecoration(labelText: 'Other names'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Birthday field in light blue box
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _birthdayController,
                    decoration: const InputDecoration(
                      labelText: 'Birthday',
                      hintText: 'Select Your Birthday',
                    ),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _birthdayController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your birthday';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Address fields in light blue box
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Address',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _streetNoController,
                        decoration: const InputDecoration(labelText: 'Street No.'),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _streetNameController,
                        decoration: const InputDecoration(labelText: 'Street Name/s'),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _cityController,
                        decoration: const InputDecoration(labelText: 'City'),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _postalCodeController,
                        decoration: const InputDecoration(labelText: 'Postal Code'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // NIC field in light blue box with validation
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _nicController,
                    decoration: const InputDecoration(labelText: 'NIC'),
                    validator: _validateNIC,
                  ),
                ),
                const SizedBox(height: 20),

                // Usual meal times in light blue box
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Usual Meal Times (You can change these later)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        title: const Text('Breakfast'),
                        trailing: Text(_breakfastTime == null
                            ? 'Set Time'
                            : _breakfastTime!.format(context)),
                        onTap: () async {
                          TimeOfDay? selectedTime = await showTimePicker(
                            context: context,
                            initialTime: const TimeOfDay(hour: 6, minute: 0),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _breakfastTime = selectedTime;
                            });
                          }
                        },
                      ),
                      ListTile(
                        title: const Text('Lunch'),
                        trailing: Text(_lunchTime == null
                            ? 'Set Time'
                            : _lunchTime!.format(context)),
                        onTap: () async {
                          TimeOfDay? selectedTime = await showTimePicker(
                            context: context,
                            initialTime: const TimeOfDay(hour: 12, minute: 0),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _lunchTime = selectedTime;
                            });
                          }
                        },
                      ),
                      ListTile(
                        title: const Text('Dinner'),
                        trailing: Text(_dinnerTime == null
                            ? 'Set Time'
                            : _dinnerTime!.format(context)),
                        onTap: () async {
                          TimeOfDay? selectedTime = await showTimePicker(
                            context: context,
                            initialTime: const TimeOfDay(hour: 18, minute: 0),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _dinnerTime = selectedTime;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Register button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Implement form submission logic

                      // After successful registration, navigate to Patient Home Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PatientHomeScreen()),
                      );
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}