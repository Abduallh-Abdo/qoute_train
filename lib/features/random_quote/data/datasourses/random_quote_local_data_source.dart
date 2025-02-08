import 'dart:convert';

import 'package:qoute_train/core/error/exceptions.dart';
import 'package:qoute_train/core/utils/app_strings.dart';
import 'package:qoute_train/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(
      AppStrings.cacheRandomQuote,
      json.encode(quote),
    );
  }

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString = sharedPreferences.getString(AppStrings.cacheRandomQuote);

    if (jsonString != null) {
      final cacheRandomQoute = Future.value(
        QuoteModel.fromJson(
          json.decode(jsonString),
        ),
      );

      return cacheRandomQoute;
    } else {
      throw CacheException();
    }
  }
}
