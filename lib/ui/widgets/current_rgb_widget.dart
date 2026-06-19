import 'package:flutter/material.dart';
import 'package:test_rgb_flutter/states/provider.dart';
import 'package:test_rgb_flutter/states/random_color_notifier.dart';
import 'package:test_rgb_flutter/ui/widgets/text_card.dart';

/// A widget that renders each RGB value separately with its specific
/// color. It also changes it layout a column to a row depending on screen width
class CurrentRGBWidget extends StatelessWidget {
  /// Constant value of the first text widget
  static const String currentRGBLabel = 'Your current values are:';

  /// Constant for row spacing
  static const double rowSpacing = 5;

  /// fontsize for currentRGBLabel
  static const double fontSize = 20;

  /// value based on average value of mobile viewport widths
  static const double smallScreensWidth = 400;

  /// Constructor for this widget
  const CurrentRGBWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<RandomColorNotifier>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentRGBLabel,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: notifier.value.colorOpposite(),
          ),
        ),
        LayoutBuilder(
          builder: (_, constraints) {
            final rgbCards = [
              TextCard(
                label: 'R (${notifier.value.red})',
                textColor: notifier.value.colorRed(),
              ),
              TextCard(
                label: 'G (${notifier.value.green})',
                textColor: notifier.value.colorGreen(),
              ),
              TextCard(
                label: 'B (${notifier.value.blue})',
                textColor: notifier.value.colorBlue(),
              ),
            ];

            /// change to a column on smaller screens like a mobile one.
            if (constraints.maxWidth < smallScreensWidth) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: rgbCards,
              );
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: rowSpacing,
              children: rgbCards,
            );
          },
        ),
      ],
    );
  }
}
