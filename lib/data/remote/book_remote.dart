import 'package:dio/dio.dart';
import 'package:flutter_bible_app/data/models/book_model.dart';
import 'package:flutter_bible_app/data/models/chapter_model.dart';

class BookRemote {
  final Dio _dio;

  BookRemote({Dio? dio}) : _dio = dio ?? Dio();

  Future<BookModel> getBooks() async {
    try {
      final response = await _dio.get('https://bible-api.com/data/almeida');

      if (response.statusCode == 200) {
        return BookModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load books: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<ChapterModel> getBook(String bookId) async {
    try {
      final response = await _dio.get(
        'https://bible-api.com/data/almeida/$bookId',
      );
      if (response.statusCode == 200) {
        return ChapterModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load book: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
