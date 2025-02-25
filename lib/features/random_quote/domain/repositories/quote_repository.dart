import 'package:dartz/dartz.dart';
import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/features/random_quote/domain/entities/quote_entity.dart';

abstract class QuoteRepository {
  Future<Either<Failure, QuoteEntity>> getRandomQuote();
}
