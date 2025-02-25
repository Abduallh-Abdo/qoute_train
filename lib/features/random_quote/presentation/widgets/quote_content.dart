import 'package:flutter/material.dart';
import 'package:qoute_train/core/utils/app_colors.dart';
import 'package:qoute_train/core/utils/media_query_values.dart';
import 'package:qoute_train/features/random_quote/domain/entities/quote_entity.dart';

class QuoteContent extends StatelessWidget {
  final QuoteEntity quote;
  const QuoteContent({super.key, required this.quote});

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
            quote.quoteContent,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: context.height / 15,
          ),
          Text(
            quote.author,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
