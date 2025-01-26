import 'package:dartz/dartz.dart';
import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/features/random_qoute/domain/entities/qoute.dart';

abstract class QouteRepository {
  Future<Either<Failure, Qoute>> getRandomQout();
}
 