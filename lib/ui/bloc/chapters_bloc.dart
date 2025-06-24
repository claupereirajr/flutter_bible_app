import 'package:bloc/bloc.dart';
import 'package:flutter_bible_app/domain/usecases/get_chapters_usecase.dart';
import 'package:flutter_bible_app/ui/bloc/chapters_event.dart';
import 'package:flutter_bible_app/ui/bloc/chapters_state.dart';

class ChaptersBloc extends Bloc<ChaptersEvent, ChaptersState> {
  final GetChaptersUseCase getChaptersUseCase;

  ChaptersBloc({required this.getChaptersUseCase}) : super(ChaptersInitial()) {
    on<FetchChapters>((event, emit) async {
      emit(ChaptersLoading());
      try {
        final chapters = await getChaptersUseCase(event.bookId);
        emit(ChaptersLoaded(chapters));
      } catch (e) {
        emit(ChaptersError(e.toString()));
      }
    });
  }
}
