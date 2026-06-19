import 'dart:ui';

/// Class for the RGB color model
class RandomColorModel {
  /// int value for red
  final int red;

  /// int value for green
  final int green;

  /// int value for blue
  final int blue;

  /// [_maxValue] the maximum value from the range from 0 to 255
  static const int _maxValue = 255;

  /// [_minValue] the minimum value from the range from 0 to 255
  static const int _minValue = 0;

  static const int _initialValue = 0;

  /// Constructor of the class containing RGB
  /// R[red] G[green] B[blue]
  RandomColorModel({
    this.red = _initialValue,
    this.green = _initialValue,
    this.blue = _initialValue,
  });

  /// copyWith method for changing the values with the previous data
  /// needed.
  RandomColorModel copyWith({
    int? red,
    int? green,
    int? blue,
  }) {
    return RandomColorModel(
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
    );
  }

  /// Return Color using all the values of the model
  Color color() => Color.fromARGB(_maxValue, red, green, blue);

  /// Return Color using only red
  Color colorRed() => Color.fromARGB(
    _maxValue,
    red,
    _minValue,
    _minValue,
  );

  /// Return Color using only green
  Color colorGreen() => Color.fromARGB(
    _maxValue,
    _minValue,
    green,
    _minValue,
  );

  /// Return Color using only blue
  Color colorBlue() => Color.fromARGB(
    _maxValue,
    _minValue,
    _minValue,
    blue,
  );

  /// Return the opposite of the color, by subtracting the current color value
  ///  to the maximum we get the opposite color of the current values
  Color colorOpposite() => Color.fromARGB(
    _maxValue,
    _maxValue - red,
    _maxValue - green,
    _maxValue - blue,
  );
}
