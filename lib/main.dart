// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_application_ethan/ui/Matches/match_screen_1.dart';
import 'package:flutter_application_ethan/ui/Matches/match_screen_2.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // true in debug mode
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: MatchScreen2 (),
    );
  }
}
