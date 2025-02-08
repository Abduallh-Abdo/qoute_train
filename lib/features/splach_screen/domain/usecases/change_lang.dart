import 'package:dartz/dartz.dart';
import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/features/splach_screen/domain/repositories/lang_repository.dart';

import '../../../../core/usecases/usecase.dart';

class ChangeLangUseCases implements UseCase<bool, String> {
  final LangRepository langRepository;
  ChangeLangUseCases({
    required this.langRepository,
  });

  @override
  Future<Either<Failure, bool>> call(String langCode) async =>
      await langRepository.changeLang(langCode: langCode);
}
