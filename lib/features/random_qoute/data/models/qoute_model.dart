import 'package:qoute_train/features/random_qoute/domain/entities/qoute.dart';

class QouteModel extends Qoute {
  //!both method is correct
  // const QouteModel(
  //     {required String auther,
  //     required String qouteContent,
  //     required int id,
  //     required String permalink})
  //     : super(
  //         auther: auther,
  //         qouteContent: qouteContent,
  //         id: id,
  //         permalink: permalink,
  //       );

  //!both method is correct
  const QouteModel({
    required super.auther,
    required super.qouteContent,
    required super.id,
    required super.permalink,
  });

  factory QouteModel.fromJson(Map<String, dynamic> json) => QouteModel(
        auther: json['auther'],
        qouteContent: json['qoute'],
        id: json['id'],
        permalink: json['permalink'],
      );

  Map<String, dynamic> toJson() => {
        'auther': auther,
        'qoute': qouteContent,
        'id': id,
        'permalink': permalink,
      };
}
