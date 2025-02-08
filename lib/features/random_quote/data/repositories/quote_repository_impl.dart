import 'package:dartz/dartz.dart';
import 'package:qoute_train/core/error/exceptions.dart';
import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/core/network/network_info.dart';
import 'package:qoute_train/features/random_quote/data/datasourses/random_quote_local_data_source.dart';
import 'package:qoute_train/features/random_quote/data/datasourses/random_quote_remote_data_source.dart';
import 'package:qoute_train/features/random_quote/domain/entities/quote.dart';
import 'package:qoute_train/features/random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImpl({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(localRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
