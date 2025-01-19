import 'package:equatable/equatable.dart';

class Qoute extends Equatable {
  final String auther;
  final String qouteContent;
  final int id;
  final String permalink;

  const Qoute({
    required this.auther,
    required this.qouteContent,
    required this.id,
    required this.permalink,
  });
  @override
  List<Object?> get props => throw UnimplementedError();
}
