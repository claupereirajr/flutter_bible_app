import 'package:flutter_bible_app/domain/entities/verse_entity.dart';
import 'package:flutter_bible_app/domain/repositories/chapter_repository.dart';

class GetVersesUseCase {
  final ChapterRepository _chapterRepository;

  GetVersesUseCase({required ChapterRepository chapterRepository})
    : _chapterRepository = chapterRepository;

  Future<List<Verse>> call(String bookId, int chapterId) async {
    try {
      final verseModel = await _chapterRepository.getChapter(bookId, chapterId);
      return verseModel.verses;
    } catch (e) {
      throw Exception('UseCase error: $e');
    }
  }
}
