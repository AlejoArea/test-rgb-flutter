import 'package:flutter/material.dart';
import 'package:test_rgb_flutter/model/random_color_model.dart';
import 'package:test_rgb_flutter/states/provider.dart';
import 'package:test_rgb_flutter/states/random_color_notifier.dart';
import 'package:test_rgb_flutter/ui/main_page.dart';

void main() {
  runApp(const MyApp());
}


// ignore: public_member_api_docs, prefer_match_file_name
class MyApp extends StatefulWidget {
  // ignore: public_member_api_docs
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final _notifier = RandomColorNotifier(
    RandomColorModel(),
  );
  @override
  Widget build(BuildContext context) {
    return Provider(
      notifier: _notifier,
      child: MaterialApp(
        title: 'Flutter RGB clicker',
        theme: ThemeData(

          colorScheme: .fromSeed(seedColor: Colors.blueGrey),
        ),
        home: const MainPage(),
      ),
    );
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }
}
