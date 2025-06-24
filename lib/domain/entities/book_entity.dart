import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  const BookEntity({required this.translation, required this.books});

  final Translation? translation;
  final List<Book> books;

  BookEntity copyWith({Translation? translation, List<Book>? books}) {
    return BookEntity(
      translation: translation ?? this.translation,
      books: books ?? this.books,
    );
  }

  factory BookEntity.fromJson(Map<String, dynamic> json) {
    return BookEntity(
      translation: json["translation"] == null
          ? null
          : Translation.fromJson(json["translation"]),
      books: json["books"] == null
          ? []
          : List<Book>.from(json["books"]!.map((x) => Book.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "translation": translation?.toJson(),
    "books": books.map((x) => x.toJson()).toList(),
  };

  @override
  String toString() {
    return "$translation, $books, ";
  }

  @override
  List<Object?> get props => [translation, books];
}

class Book extends Equatable {
  const Book({required this.id, required this.name, required this.url});

  final String? id;
  final String? name;
  final String? url;

  Book copyWith({String? id, String? name, String? url}) {
    return Book(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(id: json["id"], name: json["name"], url: json["url"]);
  }

  Map<String, dynamic> toJson() => {"id": id, "name": name, "url": url};

  @override
  String toString() {
    return "$id, $name, $url, ";
  }

  @override
  List<Object?> get props => [id, name, url];
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
