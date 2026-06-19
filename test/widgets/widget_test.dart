import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_rgb_flutter/main.dart';
import 'package:test_rgb_flutter/model/random_color_model.dart';
import 'package:test_rgb_flutter/states/provider.dart';
import 'package:test_rgb_flutter/states/random_color_notifier.dart';
import 'package:test_rgb_flutter/ui/widgets/app_bar_title.dart';
import 'package:test_rgb_flutter/ui/widgets/colored_body.dart';
import 'package:test_rgb_flutter/ui/widgets/current_rgb_widget.dart';
import 'package:test_rgb_flutter/ui/widgets/hello_text.dart';
import 'package:test_rgb_flutter/ui/widgets/text_card.dart';

void main() {
  const int start = 0;
  const int end = 30;
  testWidgets('Widgets render', (WidgetTester tester) async {
    /// constant value for the widgets on CurrentRGB widget
    const int widgetCountCurrentRGB = 3;

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that all the widgets render
    expect(find.byType(ColoredBody), findsOneWidget);
    expect(find.byType(CurrentRGBWidget), findsOneWidget);
    expect(find.byType(HelloText), findsOneWidget);
    expect(find.byType(AppBarTitle), findsOneWidget);
    expect(find.byType(TextCard), findsNWidgets(widgetCountCurrentRGB));
  });
  group('Proving a notifier to test the on tap', () {
    Widget widgetWithProvider(
      RandomColorNotifier notifier,
    ) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: MaterialApp(
          home: Provider<RandomColorNotifier>(
            notifier: notifier,
            child: Scaffold(
              appBar: AppBar(
                title: const AppBarTitle(),
              ),
              body: const ColoredBody(),
            ),
          ),
        ),
      );
    }

    testWidgets('tapping triggers the notifier randomize for ColoredBody', (
      tester,
    ) async {
      final notifier = RandomColorNotifier(RandomColorModel());
      var notified = false;
      notifier.addListener(() => notified = true);

      await tester.pumpWidget(widgetWithProvider(notifier));

      await tester.tap(find.byType(ColoredBody));
      await tester.pump();

      expect(notified, isTrue);
    });
    testWidgets('tapping triggers the notifier randomize for AppbarTitle', (
      tester,
    ) async {
      final notifier = RandomColorNotifier(RandomColorModel());
      var notified = false;
      notifier.addListener(() => notified = true);
      await tester.pumpWidget(widgetWithProvider(notifier));

      await tester.tap(find.byType(AppBarTitle));
      await tester.pump();

      expect(notified, isTrue);
    });
  });

  /// Following the same pattern as Random Color Notifier Tests. This test
  /// needs to cover for the edge case of 1 in 256^3 to get the same color
  /// as the initial values.
  testWidgets('tapping the app changes the background color', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    Color? backgroundColor() => tester
        .widget<ColoredBox>(
          find.byKey(
            ColoredBody.backgroundKey,
          ),
        )
        .color;

    final appColorChanges = <Color?>{backgroundColor()};

    for (var i = start; i < end; i++) {
      await tester.tap(find.byType(ColoredBody));
      await tester.pump();
      appColorChanges.add(backgroundColor());
    }

    /// if the color changes this length should be greater than 1
    expect(appColorChanges.length, greaterThan(1));
  });

  /// Same idea as previous test but with the appbar that also has that onTap
  testWidgets('tapping the appBarTitle changes the background color', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    Color? backgroundColor() => tester
        .widget<ColoredBox>(
          find.byKey(
            ColoredBody.backgroundKey,
          ),
        )
        .color;

    final appColorChanges = <Color?>{backgroundColor()};

    for (var i = start; i < end; i++) {
      await tester.tap(find.byType(AppBarTitle));
      await tester.pump();
      appColorChanges.add(backgroundColor());
    }

    expect(appColorChanges.length, greaterThan(1));
  });
}
