import 'package:flutter_bible_app/data/models/book_model.dart';
import 'package:flutter_bible_app/data/models/chapter_model.dart';

abstract class BookRepository {
  Future<BookModel> getBooks();
  Future<ChapterModel> getBook(String bookId);
}
