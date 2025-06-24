import 'package:equatable/equatable.dart';

sealed class VersesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchVerses extends VersesEvent {
  final String bookId;
  final int chapterId;

  FetchVerses(this.bookId, this.chapterId);

  @override
  List<Object> get props => [bookId, chapterId];
}
