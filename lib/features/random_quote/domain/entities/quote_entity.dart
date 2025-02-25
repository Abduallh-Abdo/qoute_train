import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final String author;
  final String quoteContent;
  final String id;
  // final String dateAdded;
  // final String dateModified;
  // final List<String> tags;

  const QuoteEntity({
    required this.author,
    required this.quoteContent,
    required this.id,
    // required this.dateAdded,
    // required this.dateModified,
  });
  @override
  List<Object?> get props => [
        author,
        quoteContent,
        id,
        // dateAdded,
        // dateModified,
      ];
}
