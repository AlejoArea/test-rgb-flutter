import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_rgb_flutter/model/random_color_model.dart';

/// Value notifier for the color
class RandomColorNotifier extends ValueNotifier<RandomColorModel> {
  final Random _random = Random();

  /// colorRange is 256 so _random.nextInt(colorRange)
  /// Value is >= 0 and < 256.
  static const int colorRange = 256;

  /// Constructor RandomColorNotifier
  RandomColorNotifier(super.state);

  /// Randomize RGB to be used on Color.fromRGB with random values
  /// nextInt method with a range from 0 to 255.
  void randomizeColor() {
    final randomRed = _random.nextInt(colorRange);
    final randomGreen = _random.nextInt(colorRange);
    final randomBlue = _random.nextInt(colorRange);
    value = value.copyWith(
      red: randomRed,
      green: randomGreen,
      blue: randomBlue,
    );
  }
}
