import 'package:flutter/material.dart';
import 'package:trackpulse/features/auth/presentation/pages/onboarding.dart';
import 'package:trackpulse/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appThemeData,
      title: 'trackpulse',
      home: Onboarding(),
    );
  }
}
