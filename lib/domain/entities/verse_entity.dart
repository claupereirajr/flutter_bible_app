import 'package:equatable/equatable.dart';

class VerseEntity extends Equatable {
  const VerseEntity({required this.translation, required this.verses});

  final Translation? translation;
  final List<Verse> verses;

  VerseEntity copyWith({Translation? translation, List<Verse>? verses}) {
    return VerseEntity(
      translation: translation ?? this.translation,
      verses: verses ?? this.verses,
    );
  }

  factory VerseEntity.fromJson(Map<String, dynamic> json) {
    return VerseEntity(
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

  @override
  String toString() {
    return "$translation, $verses, ";
  }

  @override
  List<Object?> get props => [translation, verses];
}

class Translation extends Equatable {
  const Translation({
    required this.identifier,
    required this.name,
    required this.language,
    required this.languageCode,
    required this.license,
  });

  final String? identifier;
  final String? name;
  final String? language;
  final String? languageCode;
  final String? license;

  Translation copyWith({
    String? identifier,
    String? name,
    String? language,
    String? languageCode,
    String? license,
  }) {
    return Translation(
      identifier: identifier ?? this.identifier,
      name: name ?? this.name,
      language: language ?? this.language,
      languageCode: languageCode ?? this.languageCode,
      license: license ?? this.license,
    );
  }

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      identifier: json["identifier"],
      name: json["name"],
      language: json["language"],
      languageCode: json["language_code"],
      license: json["license"],
    );
  }

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "name": name,
    "language": language,
    "language_code": languageCode,
    "license": license,
  };

  @override
  String toString() {
    return "$identifier, $name, $language, $languageCode, $license, ";
  }

  @override
  List<Object?> get props => [
    identifier,
    name,
    language,
    languageCode,
    license,
  ];
}

class Verse extends Equatable {
  const Verse({
    required this.bookId,
    required this.book,
    required this.chapter,
    required this.verse,
    required this.text,
  });

  final String? bookId;
  final String? book;
  final int? chapter;
  final int? verse;
  final String? text;

  Verse copyWith({
    String? bookId,
    String? book,
    int? chapter,
    int? verse,
    String? text,
  }) {
    return Verse(
      bookId: bookId ?? this.bookId,
      book: book ?? this.book,
      chapter: chapter ?? this.chapter,
      verse: verse ?? this.verse,
      text: text ?? this.text,
    );
  }

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      bookId: json["book_id"],
      book: json["book"],
      chapter: json["chapter"],
      verse: json["verse"],
      text: json["text"],
    );
  }

  Map<String, dynamic> toJson() => {
    "book_id": bookId,
    "book": book,
    "chapter": chapter,
    "verse": verse,
    "text": text,
  };

  @override
  String toString() {
    return "$bookId, $book, $chapter, $verse, $text, ";
  }

  @override
  List<Object?> get props => [bookId, book, chapter, verse, text];
}
