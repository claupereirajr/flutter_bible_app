import 'package:flutter_bible_app/data/models/chapter_model.dart';
import 'package:flutter_bible_app/data/remote/book_remote.dart';
import 'package:flutter_bible_app/data/models/book_model.dart';
import 'package:flutter_bible_app/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemote _bookRemote;

  BookRepositoryImpl({BookRemote? bookRemote})
    : _bookRemote = bookRemote ?? BookRemote();

  @override
  Future<BookModel> getBooks() async {
    try {
      return await _bookRemote.getBooks();
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }

  @override
  Future<ChapterModel> getBook(String bookId) async {
    try {
      return await _bookRemote.getBook(bookId);
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}
