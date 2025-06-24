import 'package:flutter_bible_app/data/models/verse_model.dart';
import 'package:flutter_bible_app/data/remote/chapter_remote.dart';
import 'package:flutter_bible_app/domain/repositories/chapter_repository.dart';

class ChapterRepositoryImpl implements ChapterRepository {
  final ChapterRemote _chapterRemote;

  ChapterRepositoryImpl({ChapterRemote? chapterRemote})
    : _chapterRemote = chapterRemote ?? ChapterRemote();

  @override
  Future<VerseModel> getChapter(String bookId, int chapterId) async {
    try {
      return await _chapterRemote.getChapter(bookId, chapterId);
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}
