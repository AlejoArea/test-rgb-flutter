import 'package:flutter/material.dart';

/// This is the main text of the app widget
class HelloText extends StatelessWidget {
  /// The constructor for the widget
  const HelloText({super.key});

  /// This this is the constant value for the requirement main text
  /// of the app.
  static const helloText = 'Hello There';

  /// fontSize for Hello There
  static const double fontSize = 24;

  @override
  Widget build(BuildContext context) {
    return const Text(
      helloText,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: .w500,
        color: Colors.white,
      ),
    );
  }
}
