import 'package:dartz/dartz.dart';

import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/core/usecases/usecase.dart';
import 'package:qoute_train/features/random_quote/domain/entities/quote_entity.dart';
import 'package:qoute_train/features/random_quote/domain/repositories/quote_repository.dart';

class GetRandomQuote implements UseCase<QuoteEntity, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuote({
    required this.quoteRepository,
  });

  @override
  Future<Either<Failure, QuoteEntity>> call(NoParams params) =>
      quoteRepository.getRandomQuote();
}
