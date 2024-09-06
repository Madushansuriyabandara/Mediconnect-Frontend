import 'package:flutter/material.dart';
import 'dart:ui'; // For blur effect

class BlurredBox extends StatelessWidget {
  final Widget child;

  const BlurredBox({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0), // Reduced blurriness
          child: Container(
            width: 300.0,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: child, // Embed input fields and buttons
          ),
        ),
      ),
    );
  }
}
