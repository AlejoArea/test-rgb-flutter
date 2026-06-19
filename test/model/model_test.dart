import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_rgb_flutter/model/random_color_model.dart';

/// Test for the RandomColorModel

void main() {
  const int initialValue = 150;
  group('RandomColorModel tests', () {
    group('Copywith Method', () {
      test('Changing one color does not change the other values', () {
        final testModel = RandomColorModel(
          red: initialValue,
          green: initialValue,
          blue: initialValue,
        );

        /// initial values
        expect(testModel.red, initialValue);
        expect(testModel.blue, initialValue);
        expect(testModel.green, initialValue);

        /// change red
        const int newValue = 75;
        final resultModel = testModel.copyWith(
          red: newValue,
        );

        /// validate values
        expect(resultModel.red, newValue);
        expect(resultModel.blue, initialValue);
        expect(resultModel.green, initialValue);

        /// validate that the original model does not chage (inmutabillity)
        expect(testModel.red, initialValue);
      });
    });

    group('Color methods', () {
      final testModel = RandomColorModel(
        red: initialValue,
        green: initialValue,
        blue: initialValue,
      );

      /// same value used on the model for alpha and opposite calculation
      const int maxValue = 255;
      const int zeroColorValue = 0;
      test('color returns correct value', () {
        const colorTest = Color.fromARGB(
          maxValue,
          initialValue,
          initialValue,
          initialValue,
        );

        /// Validate that the result is the same given the same
        /// values as the initial test model
        expect(testModel.color(), colorTest);
      });
      test('colorRed returns correct value', () {
        const colorTest = Color.fromARGB(
          maxValue,
          initialValue,
          zeroColorValue,
          zeroColorValue,
        );

        /// Validate that the result is the same given the same
        /// values as the initial test model for red value
        expect(testModel.colorRed(), colorTest);
      });
      test('colorGreen returns correct value', () {
        const colorTest = Color.fromARGB(
          maxValue,
          zeroColorValue,
          initialValue,
          zeroColorValue,
        );

        /// Validate that the result is the same given the same
        /// values as the initial test model for green value
        expect(testModel.colorGreen(), colorTest);
      });
      test('colorGreen returns correct value', () {
        const colorTest = Color.fromARGB(
          maxValue,
          zeroColorValue,
          zeroColorValue,
          initialValue,
        );

        /// Validate that the result is the same given the same
        /// values as the initial test model for blue value
        expect(testModel.colorBlue(), colorTest);
      });
      test('colorOpposite returns correct value', () {
        /// use the same logic for the calculation of the opposite
        const colorTest = Color.fromARGB(
          maxValue,
          maxValue - initialValue,
          maxValue - initialValue,
          maxValue - initialValue,
        );

        /// Validate that the result is the same given the same
        /// as the oppossite of the model
        expect(testModel.colorOpposite(), colorTest);
      });
    });
  });
}
