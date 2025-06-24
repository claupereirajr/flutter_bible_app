import 'package:equatable/equatable.dart';

abstract class ChaptersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchChapters extends ChaptersEvent {
  final String bookId;
  FetchChapters(this.bookId);

  @override
  List<Object?> get props => [bookId];
}
