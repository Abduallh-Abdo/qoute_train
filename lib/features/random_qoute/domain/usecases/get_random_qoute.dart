// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/core/usecases/usecase.dart';
import 'package:qoute_train/features/random_qoute/domain/entities/qoute.dart';
import 'package:qoute_train/features/random_qoute/domain/repositories/qoute_repository.dart';

class GetRandomQoute implements Usecase<Qoute, NoParams> {
  final QouteRepository qouteRepository;

  GetRandomQoute({
    required this.qouteRepository,
  });

  @override
  Future<Either<Failure, Qoute>> call(params) =>
      qouteRepository.getRandomQout();
}
