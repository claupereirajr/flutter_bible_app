import 'package:flutter_bible_app/domain/entities/book_entity.dart';
import 'package:flutter_bible_app/domain/repositories/book_repository.dart';

class GetBooksUseCase {
  final BookRepository _bookRepository;

  GetBooksUseCase({required BookRepository bookRepository})
    : _bookRepository = bookRepository;

  Future<List<Book>> call() async {
    try {
      final bookModel = await _bookRepository.getBooks();
      return bookModel.books;
    } catch (e) {
      throw Exception('UseCase error: $e');
    }
  }
}
