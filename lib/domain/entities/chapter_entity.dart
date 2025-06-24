import 'package:equatable/equatable.dart';

class ChapterEntity extends Equatable {
  const ChapterEntity({required this.translation, required this.chapters});

  final Translation? translation;
  final List<Chapter> chapters;

  ChapterEntity copyWith({Translation? translation, List<Chapter>? chapters}) {
    return ChapterEntity(
      translation: translation ?? this.translation,
      chapters: chapters ?? this.chapters,
    );
  }

  factory ChapterEntity.fromJson(Map<String, dynamic> json) {
    return ChapterEntity(
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

  @override
  String toString() {
    return "$translation, $chapters, ";
  }

  @override
  List<Object?> get props => [translation, chapters];
}

class Chapter extends Equatable {
  const Chapter({
    required this.bookId,
    required this.book,
    required this.chapter,
    required this.url,
  });

  final String? bookId;
  final String? book;
  final int? chapter;
  final String? url;

  Chapter copyWith({String? bookId, String? book, int? chapter, String? url}) {
    return Chapter(
      bookId: bookId ?? this.bookId,
      book: book ?? this.book,
      chapter: chapter ?? this.chapter,
      url: url ?? this.url,
    );
  }

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      bookId: json["book_id"],
      book: json["book"],
      chapter: json["chapter"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "book_id": bookId,
    "book": book,
    "chapter": chapter,
    "url": url,
  };

  @override
  String toString() {
    return "$bookId, $book, $chapter, $url, ";
  }

  @override
  List<Object?> get props => [bookId, book, chapter, url];
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
