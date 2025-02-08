import 'package:dartz/dartz.dart';
import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/core/usecases/usecase.dart';
import 'package:qoute_train/features/splach_screen/domain/repositories/lang_repository.dart';

class GetSavedLangUseCases implements UseCase<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUseCases({required this.langRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      await langRepository.getSavedLang();
}
