import 'package:bloc/bloc.dart';
import 'package:flutter_bible_app/domain/usecases/get_verses_usecase.dart';
import 'package:flutter_bible_app/ui/bloc/verses_event.dart';
import 'package:flutter_bible_app/ui/bloc/verses_state.dart';

class VersesBloc extends Bloc<VersesEvent, VersesState> {
  final GetVersesUseCase getVersesUseCase;

  VersesBloc({required this.getVersesUseCase}) : super(VersesInitial()) {
    on<FetchVerses>((event, emit) async {
      emit(VersesLoading());
      try {
        final verses = await getVersesUseCase(event.bookId, event.chapterId);
        emit(VersesLoaded(verses));
      } catch (e) {
        emit(VersesError(e.toString()));
      }
    });
  }
}
