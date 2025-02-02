import 'package:flutter/material.dart';
import 'package:qoute_train/core/utils/app_colors.dart';
import 'package:qoute_train/core/utils/media_query_values.dart';
import 'package:qoute_train/features/random_qoute/domain/entities/qoute.dart';

class QouteContent extends StatelessWidget {
  final Qoute qoute;
  const QouteContent({super.key, required this.qoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            qoute.qouteContent,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: context.height / 15,
          ),
          Text(
            qoute.auther,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
