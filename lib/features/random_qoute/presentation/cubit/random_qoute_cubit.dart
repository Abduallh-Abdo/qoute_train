import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/core/usecases/usecase.dart';
import 'package:qoute_train/core/utils/app_strings.dart';
import 'package:qoute_train/features/random_qoute/domain/entities/qoute.dart';
import 'package:qoute_train/features/random_qoute/domain/usecases/get_random_qoute.dart';
part 'random_qoute_state.dart';

class RandomQouteCubit extends Cubit<RandomQouteState> {
  final GetRandomQoute getRandomQouteUseCase;
  RandomQouteCubit({required this.getRandomQouteUseCase})
      : super(RandomQouteInitial());
      
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
  
  
  Future<void> getRandomQoute() async {
    Either<Failure, Qoute> response = await getRandomQouteUseCase(NoParams());
    emit(
      response.fold(
        (failure) => RandomQouteError(msg: mapFailuretoMsg(failure)),
        (qoute) => RandomQouteLoaded(qoute: qoute),
      ),
    );
  }

}
