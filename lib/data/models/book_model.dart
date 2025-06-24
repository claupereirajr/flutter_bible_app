import 'package:flutter_bible_app/domain/entities/book_entity.dart';

class BookModel {
  const BookModel({required this.translation, required this.books});

  final Translation? translation;
  final List<Book> books;

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      translation: json["translation"] == null
          ? null
          : Translation.fromJson(json["translation"]),
      books: json["books"] == null
          ? []
          : List<Book>.from(json["books"]!.map((x) => Book.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "translation": translation?.toJson(),
    "books": books.map((x) => x.toJson()).toList(),
  };
}
