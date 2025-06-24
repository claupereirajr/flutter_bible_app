import 'package:flutter_bible_app/domain/entities/verse_entity.dart';

class VerseModel {
  const VerseModel({required this.translation, required this.verses});

  final Translation? translation;
  final List<Verse> verses;

  factory VerseModel.fromJson(Map<String, dynamic> json) {
    return VerseModel(
      translation: json["translation"] == null
          ? null
          : Translation.fromJson(json["translation"]),
      verses: json["verses"] == null
          ? []
          : List<Verse>.from(json["verses"]!.map((x) => Verse.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "translation": translation?.toJson(),
    "verses": verses.map((x) => x.toJson()).toList(),
  };
}
