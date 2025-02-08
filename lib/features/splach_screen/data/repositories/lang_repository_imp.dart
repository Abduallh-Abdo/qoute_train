import 'package:dartz/dartz.dart';
import 'package:qoute_train/core/error/exceptions.dart';
import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/features/splach_screen/data/datasources/lang_local_data_source.dart';
import 'package:qoute_train/features/splach_screen/domain/repositories/lang_repository.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
