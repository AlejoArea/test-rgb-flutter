import 'package:flutter/material.dart';
import 'package:test_rgb_flutter/states/provider.dart';
import 'package:test_rgb_flutter/states/random_color_notifier.dart';

/// Appbar title, with a Gesture Detector with onTap
/// that triggers background color change.
class AppBarTitle extends StatelessWidget {
  /// Constant value for the appbar title
  static const String title = 'RGB clicker!';

  /// Constructor for the widget
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<RandomColorNotifier>(context);

    return GestureDetector(
      onTap: notifier.randomizeColor,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
