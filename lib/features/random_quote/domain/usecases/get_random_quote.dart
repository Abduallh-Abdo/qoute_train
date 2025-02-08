// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/core/usecases/usecase.dart';
import 'package:qoute_train/features/random_quote/domain/entities/quote.dart';
import 'package:qoute_train/features/random_quote/domain/repositories/quote_repository.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({
    required this.quoteRepository,
  });

  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      quoteRepository.getRandomQuote();
}
