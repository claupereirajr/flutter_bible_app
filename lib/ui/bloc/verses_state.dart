import 'package:equatable/equatable.dart';
import 'package:flutter_bible_app/domain/entities/verse_entity.dart';

sealed class VersesState extends Equatable {
  const VersesState();

  @override
  List<Object?> get props => [];
}

final class VersesInitial extends VersesState {}

final class VersesLoading extends VersesState {}

final class VersesLoaded extends VersesState {
  final List<Verse> verses;

  const VersesLoaded(this.verses);

  @override
  List<Object?> get props => [verses];
}

final class VersesError extends VersesState {
  final String message;

  const VersesError(this.message);

  @override
  List<Object?> get props => [message];
}
