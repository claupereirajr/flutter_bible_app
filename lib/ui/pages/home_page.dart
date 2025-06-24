import 'package:flutter/material.dart';
import 'package:flutter_bible_app/ui/pages/book_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/books_bloc.dart';
import '../bloc/books_event.dart';
import '../bloc/books_state.dart';
import 'package:flutter_bible_app/domain/usecases/get_books_usecase.dart';
import 'package:flutter_bible_app/data/repositories/book_repository_impl.dart';
import 'package:flutter_bible_app/data/remote/book_remote.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => BooksBloc(
          getBooksUseCase: GetBooksUseCase(
            bookRepository: BookRepositoryImpl(
              bookRemote: BookRemote(dio: Dio()),
            ),
          ),
        )..add(FetchBooks()),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Livros'), //
            backgroundColor: Colors.blue,
          ),
          body: BlocBuilder<BooksBloc, BooksState>(
            builder: (context, state) {
              if (state is BooksLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is BooksLoaded) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListView.builder(
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      final book = state.books[index];
                      return Card(
                        child: ListTile(
                          title: Text(book.name ?? ''),
                          trailing: Icon(Icons.arrow_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookPage(book: book),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              } else if (state is BooksError) {
                return Center(child: Text(state.message));
              }
              return Center(child: Text('Press button to fetch books'));
            },
          ),
        ),
      ),
    );
  }
}
