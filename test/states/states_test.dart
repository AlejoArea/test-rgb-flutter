import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_rgb_flutter/model/random_color_model.dart';
import 'package:test_rgb_flutter/states/provider.dart';
import 'package:test_rgb_flutter/states/random_color_notifier.dart';

void main() {
  group('Random Color Notifier Tests', () {
    const int initialValue = 0;
    const int maxRange = 255;
    test(
      'Validate that the initial values are correct on the RandomColorNotifier',
      () {
        final testNotifier = RandomColorNotifier(RandomColorModel());
        expect(testNotifier.value.red, initialValue);
        expect(testNotifier.value.green, initialValue);
        expect(testNotifier.value.blue, initialValue);
      },
    );
    test('Check randomize changes the values of the model', () {
      final testNotifier = RandomColorNotifier(RandomColorModel());
      testNotifier.randomizeColor();

      /// My first approach for this test was to compare colors. But This can
      /// fail but the odds are really low because its 1 in 255^3 which is the
      /// initial value for de color R=0,G=0,B=0. So it is better to check
      /// that the values are in range.

      expect(
        testNotifier.value.red,
        inInclusiveRange(initialValue, maxRange),
      );
      expect(
        testNotifier.value.green,
        inInclusiveRange(initialValue, maxRange),
      );
      expect(
        testNotifier.value.blue,
        inInclusiveRange(initialValue, maxRange),
      );
    });
    test('Check for actual randomness of the randomizeColor method', () {
      /// This test is an approach to check that the randomness works and the
      /// odds of getting let's say 30 times the same number is low. To cover
      /// the case that .randomize() is not changing the value RGB 0,0,0
      /// that its still on the 0 to 255 range.
      final testNotifier = RandomColorNotifier(RandomColorModel());
      final differentNumbersRed = <int>{};
      final differentNumbersGreen = <int>{};
      final differentNumbersBlue = <int>{};
      const int start = 0;
      const int end = 30;

      for (var i = start; i < end; i++) {
        testNotifier.randomizeColor();
        differentNumbersRed.add(testNotifier.value.red);
        differentNumbersGreen.add(testNotifier.value.green);
        differentNumbersBlue.add(testNotifier.value.blue);
      }

      /// if after 30 randomize calls the length of this sets is more
      /// than 1 the initial values changes for each of them
      expect(differentNumbersRed.length, greaterThan(1));
      expect(differentNumbersGreen.length, greaterThan(1));
      expect(differentNumbersBlue.length, greaterThan(1));
    });
  });
  group('Provider Tests', () {
    testWidgets('test Provider.of', (tester) async {
      final notifier = RandomColorNotifier(RandomColorModel());
      RandomColorNotifier? captured;

      await tester.pumpWidget(
        Provider<RandomColorNotifier>(
          notifier: notifier,

          ///used builder to be able to capture the provider for this test case
          child: Builder(
            builder: (context) {
              captured = Provider.of<RandomColorNotifier>(context);

              return const SizedBox();
            },
          ),
        ),
      );

      expect(captured, same(notifier));
    });
    testWidgets('test error when there is no provider', (tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            Provider.of<RandomColorNotifier>(context);

            return const SizedBox();
          },
        ),
      );

      expect(tester.takeException(), isException);
    });
    testWidgets('test error when the notifier is null', (tester) async {
      await tester.pumpWidget(
        Provider<RandomColorNotifier>(
          notifier: null,
          child: Builder(
            builder: (context) {
              Provider.of<RandomColorNotifier>(context);

              return const SizedBox();
            },
          ),
        ),
      );

      expect(tester.takeException(), isException);
    });
  });
}
