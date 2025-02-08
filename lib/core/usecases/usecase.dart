import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/features/random_quote/domain/entities/quote.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
