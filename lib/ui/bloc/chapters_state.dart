import 'package:equatable/equatable.dart';
import 'package:flutter_bible_app/domain/entities/chapter_entity.dart';

sealed class ChaptersState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ChaptersInitial extends ChaptersState {}

final class ChaptersLoading extends ChaptersState {}

final class ChaptersLoaded extends ChaptersState {
  final List<Chapter> chapters;

  ChaptersLoaded(this.chapters);

  @override
  List<Object?> get props => [chapters];
}

final class ChaptersError extends ChaptersState {
  final String message;

  ChaptersError(this.message);

  @override
  List<Object?> get props => [message];
}
