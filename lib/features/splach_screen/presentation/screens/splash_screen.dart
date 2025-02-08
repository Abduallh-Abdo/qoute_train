import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qoute_train/config/routes/app_routes.dart';
import 'package:qoute_train/core/utils/assets_mangers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;
  _goNext() => Navigator.pushReplacementNamed(context, Routes.randomQuoteRoute);

  _startDelay() {
    _timer = Timer(
      const Duration(seconds: 2),
      () => _goNext(),
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImgAssets.qouteImage),
      ),
    );
  }
}
