// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/ui/profile/profile_screen.dart';
import 'package:flutter_application_ethan/ui/splash_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, 
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
      home: const ProfileScreen(),
    );
  }
}
