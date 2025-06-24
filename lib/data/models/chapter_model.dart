import 'package:flutter_bible_app/domain/entities/chapter_entity.dart';

class ChapterModel {
  const ChapterModel({required this.translation, required this.chapters});

  final Translation? translation;
  final List<Chapter> chapters;

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      translation: json["translation"] == null
          ? null
          : Translation.fromJson(json["translation"]),
      chapters: json["chapters"] == null
          ? []
          : List<Chapter>.from(
              json["chapters"]!.map((x) => Chapter.fromJson(x)),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    "translation": translation?.toJson(),
    "chapters": chapters.map((x) => x.toJson()).toList(),
  };
}
