import 'package:flutter/material.dart';
import 'package:qoute_train/core/utils/app_colors.dart';

class QuoteRefresh extends StatelessWidget {
  const QuoteRefresh({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
      ),
      child: const Icon(
        color: Colors.white,
        size: 30,
        Icons.refresh,
      ),
    );
  }
}
