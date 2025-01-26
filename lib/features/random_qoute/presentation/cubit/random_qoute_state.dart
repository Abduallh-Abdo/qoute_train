part of 'random_qoute_cubit.dart';

abstract class RandomQouteState extends Equatable {
  const RandomQouteState();

  @override
  List<Object> get props => [];
}

class RandomQouteInitial extends RandomQouteState {}

class RandomQouteLoading extends RandomQouteState {}

class RandomQouteLoaded extends RandomQouteState {
  final Qoute qoute;

  const RandomQouteLoaded({required this.qoute});

  @override
  List<Object> get props => [qoute];
}

class RandomQouteError extends RandomQouteState {
  final String msg;

  const RandomQouteError({required this.msg});

  @override
  List<Object> get props => [msg];
}
