import 'package:equatable/equatable.dart';
import 'package:flutter_bible_app/domain/entities/book_entity.dart';

abstract class BooksState extends Equatable {
  const BooksState();
  @override
  List<Object?> get props => [];
}

final class BooksInitial extends BooksState {}

final class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {
  final List<Book> books;

  const BooksLoaded(this.books);

  @override
  List<Object?> get props => [books];
}

class BooksError extends BooksState {
  final String message;

  const BooksError(this.message);

  @override
  List<Object?> get props => [message];
}
