import 'package:dio/dio.dart';
import 'package:flutter_bible_app/data/models/verse_model.dart';

class ChapterRemote {
  final Dio _dio;

  ChapterRemote({Dio? dio}) : _dio = dio ?? Dio();

  Future<VerseModel> getChapter(String bookId, int chapterId) async {
    try {
      final response = await _dio.get(
        'https://bible-api.com/data/almeida/$bookId/$chapterId',
      );
      if (response.statusCode == 200) {
        return VerseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load chapter: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
