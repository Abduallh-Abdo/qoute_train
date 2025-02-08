import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/core/usecases/usecase.dart';
import 'package:qoute_train/core/utils/app_strings.dart';
import 'package:qoute_train/features/random_quote/domain/entities/quote.dart';
import 'package:qoute_train/features/random_quote/domain/usecases/get_random_quote.dart';
part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQouteUseCase;
  RandomQuoteCubit({required this.getRandomQouteUseCase})
      : super(RandomQuoteInitial());

  //* convert failure to msg
  String mapFailuretoMsg(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return AppStrings.serverFailure;
      case const (CacheFailure):
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }

  Future<void> getRandomQuote() async {
    emit(RandomQuoteLoading());
    log('init get random quote');

    try {
      Either<Failure, Quote> response = await getRandomQouteUseCase(NoParams());
      emit(
        response.fold(
          (failure) {
            log('Error: ${mapFailuretoMsg(failure)}');
            return RandomQuoteError(msg: mapFailuretoMsg(failure));
          },
          (quote) {
            log('Success: $quote');
            return RandomQuoteLoaded(quote: quote);
          },
        ),
      );
    } catch (e, stacktrace) {
      log('Exception in getRandomQuote: $e\n$stacktrace');
      emit(const RandomQuoteError(msg: AppStrings.unexpectedError));
    }

    log('end get random quote');
  }
}
