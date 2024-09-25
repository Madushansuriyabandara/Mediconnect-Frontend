// import 'package:flutter/material.dart';

// class EmailField extends StatelessWidget {
//   const EmailField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const TextField(
//       style: TextStyle(color: Colors.white), // White text for contrast
//       decoration: InputDecoration(
//         labelText: 'Email',
//         labelStyle: TextStyle(color: Colors.white),
//         filled: true,
//         fillColor: Colors.white24,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(12)),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
        hintText: 'Enter your email',
      ),
    );
  }
}

