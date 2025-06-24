import 'package:equatable/equatable.dart';

abstract class BooksEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchBooks extends BooksEvent {}
