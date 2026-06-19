import 'package:flutter/material.dart';
import 'package:test_rgb_flutter/ui/widgets/app_bar_title.dart';
import 'package:test_rgb_flutter/ui/widgets/colored_body.dart';

/// Main page widget with the ColoredBody widget.
class MainPage extends StatelessWidget {
  /// Constructor for this widget
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const AppBarTitle(),
      ),
      body: const ColoredBody(),
    );
  }
}
