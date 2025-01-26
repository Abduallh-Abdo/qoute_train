import 'package:dartz/dartz.dart';
import 'package:qoute_train/core/error/exceptions.dart';
import 'package:qoute_train/core/error/failure.dart';
import 'package:qoute_train/core/network/network_info.dart';
import 'package:qoute_train/features/random_qoute/data/datasourses/random_qoute_local_data_source.dart';
import 'package:qoute_train/features/random_qoute/data/datasourses/random_qoute_remote_data_source.dart';
import 'package:qoute_train/features/random_qoute/domain/entities/qoute.dart';
import 'package:qoute_train/features/random_qoute/domain/repositories/qoute_repository.dart';

class QouteRepositoryImpl implements QouteRepository {
  final NetworkInfo networkInfo;
  final RandomQouteRemoteDataSource randomQouteRemoteDataSource;
  final RandomQouteLocalDataSource randomQouteLocalDataSource;

  QouteRepositoryImpl({
    required this.networkInfo,
    required this.randomQouteRemoteDataSource,
    required this.randomQouteLocalDataSource,
  });

  @override
  Future<Either<Failure, Qoute>> getRandomQout() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQoute =
            await randomQouteRemoteDataSource.getRandomQoute();
        randomQouteLocalDataSource.cacheQoute(remoteRandomQoute);
        return Right(remoteRandomQoute);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localRandomQoute =
            await randomQouteLocalDataSource.getLastRandomQoute();
        return Right(localRandomQoute);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
