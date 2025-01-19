import 'package:flutter/material.dart';
import 'package:qoute_train/core/utils/app_strings.dart';
import 'package:qoute_train/features/random_qoute/presentation/widgets/qoute_content.dart';
import 'package:qoute_train/features/random_qoute/presentation/widgets/qoute_refresh.dart';

Widget buildContent() {
  return const Column(
    children: [
      QouteContent(),
      QouteRefresh(),
    ],
  );
}

class QouteScreen extends StatelessWidget {
  QouteScreen({super.key});
  final appBar = AppBar(
    title: const Text(
      AppStrings.appName,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: buildContent(),
    );
  }
}
