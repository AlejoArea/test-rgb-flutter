import 'package:flutter/material.dart';

/// Card widget that has two parameters [label] for the Text widget
/// and [textColor] for the label color
class TextCard extends StatelessWidget {
  /// label parameter
  final String label;

  /// color for the label
  final Color textColor;

  /// constant value for the fontSize
  static const double fontSize = 30.0;

  /// constant value for the padding
  static const double padding = 4.0;

  /// Constructor for the widget
  const TextCard({
    required this.label,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      // used white as value because the background may make it less visible
      // for some of the colors
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: .w500,
          ),
        ),
      ),
    );
  }
}
