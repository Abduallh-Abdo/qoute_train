import 'dart:convert';
import 'package:qoute_train/core/api/end_points.dart';
import 'package:qoute_train/core/error/exceptions.dart';
import 'package:qoute_train/core/utils/app_strings.dart';
import 'package:qoute_train/features/random_qoute/data/models/qoute_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQouteRemoteDataSource {
  Future<QouteModel> getRandomQoute();
}

class RandomQouteRemoteDataSourceImp implements RandomQouteRemoteDataSource {
  http.Client client;
  RandomQouteRemoteDataSourceImp({required this.client});
  @override
  Future<QouteModel> getRandomQoute() async {
    final randomQouteUrl = Uri.parse(EndPoints.randomQuote);
    final response = await client.get(
      randomQouteUrl,
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
      },
    );
    if (response.statusCode == 200) {
      return QouteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
