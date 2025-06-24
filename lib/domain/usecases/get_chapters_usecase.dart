import 'package:flutter_bible_app/domain/entities/chapter_entity.dart';
import 'package:flutter_bible_app/domain/repositories/book_repository.dart';

class GetChaptersUseCase {
  final BookRepository _chapterRepository;

  GetChaptersUseCase({required BookRepository bookRepository})
    : _chapterRepository = bookRepository;

  Future<List<Chapter>> call(String bookId) async {
    try {
      final chapterModel = await _chapterRepository.getBook(bookId);
      return chapterModel.chapters;
    } catch (e) {
      throw Exception('UseCase error: $e');
    }
  }
}
