import 'package:flutter_bible_app/data/models/verse_model.dart';

abstract class ChapterRepository {
  Future<VerseModel> getChapter(String bookId, int chapterId);
}
