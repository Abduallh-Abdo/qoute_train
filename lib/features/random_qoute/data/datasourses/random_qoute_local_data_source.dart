import 'dart:convert';

import 'package:qoute_train/core/error/exceptions.dart';
import 'package:qoute_train/core/utils/app_strings.dart';
import 'package:qoute_train/features/random_qoute/data/models/qoute_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQouteLocalDataSource {
  Future<QouteModel> getLastRandomQoute();
  Future<void> cacheQoute(QouteModel qoute);
}

class RandomQouteLocalDataSourceImpl extends RandomQouteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQouteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheQoute(QouteModel qoute) {
    return sharedPreferences.setString(
      AppStrings.cacheRandomQoute,
      json.encode(qoute),
    );
  }

  @override
  Future<QouteModel> getLastRandomQoute() {
    final jsonString = sharedPreferences.getString(AppStrings.cacheRandomQoute);

    if (jsonString != null) {
      final cacheRandomQoute = Future.value(
        QouteModel.fromJson(
          json.decode(jsonString),
        ),
      );

      return cacheRandomQoute;
    } else {
      throw CacheException();
    }
  }
}
