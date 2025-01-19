import 'package:flutter/material.dart';
import 'package:qoute_train/config/themes/app_themes.dart';
import 'package:qoute_train/features/random_qoute/presentation/screens/qoute_screen.dart';

class QouteApp extends StatelessWidget {
  const QouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  QouteScreen(),
      theme:appThemes(),
    );
  }
}
