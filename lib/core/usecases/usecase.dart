import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/features/random_qoute/domain/entities/qoute.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Qoute>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
