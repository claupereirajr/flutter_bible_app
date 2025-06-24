import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bible_app/ui/bloc/books_event.dart';
import 'package:flutter_bible_app/ui/bloc/books_state.dart';
import 'package:flutter_bible_app/domain/usecases/get_books_usecase.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooksUseCase getBooksUseCase;

  BooksBloc({required this.getBooksUseCase}) : super(BooksInitial()) {
    on<FetchBooks>((event, emit) async {
      emit(BooksLoading());
      try {
        final books = await getBooksUseCase();
        emit(BooksLoaded(books));
      } catch (e) {
        emit(BooksError(e.toString()));
      }
    });
  }
}
