import 'package:flutter/material.dart';
import 'package:test_rgb_flutter/states/provider.dart';
import 'package:test_rgb_flutter/states/random_color_notifier.dart';
import 'package:test_rgb_flutter/ui/widgets/current_rgb_widget.dart';
import 'package:test_rgb_flutter/ui/widgets/hello_text.dart';

/// This widget access the RandomColorNotifier exposed by the Provider.
/// Tapping anywhere triggers a randomizeColor called via the notifier, then a
/// new random color is read for, the notifier current value
class ColoredBody extends StatelessWidget {
  /// Key added for testing purpose
  static const Key backgroundKey = Key('background');

  /// Constructor for the widget
  const ColoredBody({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<RandomColorNotifier>(context);

    return GestureDetector(
      onTap: notifier.randomizeColor,
      child: ColoredBox(
        key: backgroundKey,
        color: notifier.value.color(),
        child: const SizedBox.expand(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              HelloText(),
              CurrentRGBWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
