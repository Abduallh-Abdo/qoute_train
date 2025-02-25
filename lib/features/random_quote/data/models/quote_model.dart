import 'package:qoute_train/features/random_quote/domain/entities/quote_entity.dart';

class QuoteModel extends QuoteEntity {
  //!both method is correct
  // const QuoteModel(
  //     {required String auther,
  //     required String qouteContent,
  //     required String id,
  //     required String dateAdded,
  //     required String dateModified})
  //     : super(
  //         auther: auther,
  //         qouteContent: qouteContent,
  //         id: id,
  //         dateAdded: dateAdded,
  //         dateModified: dateModified,
  //       );

  //!both method is correct
  const QuoteModel({
    required super.author,
    required super.quoteContent,
    required super.id,
    // required super.dateAdded,
    // required super.dateModified,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json['_id'] ?? '',
        author: json['author'],
        quoteContent: json['content'],
        // dateAdded: json['dateAdded'] ?? '',
        // dateModified: json['dateModified'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'author': author,
        'content': quoteContent,
        '_id': id,
        // 'dateAdded': dateAdded,
        // 'dateModified': dateModified,
      };
}
