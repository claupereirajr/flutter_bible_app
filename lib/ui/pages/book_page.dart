import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bible_app/data/remote/book_remote.dart';
import 'package:flutter_bible_app/data/repositories/book_repository_impl.dart';
import 'package:flutter_bible_app/domain/entities/book_entity.dart';
import 'package:flutter_bible_app/domain/usecases/get_chapters_usecase.dart';
import 'package:flutter_bible_app/ui/bloc/chapters_bloc.dart';
import 'package:flutter_bible_app/ui/bloc/chapters_event.dart';
import 'package:flutter_bible_app/ui/bloc/chapters_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookPage extends StatelessWidget {
  final Book book;

  const BookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ChaptersBloc(
          getChaptersUseCase: GetChaptersUseCase(
            bookRepository: BookRepositoryImpl(
              bookRemote: BookRemote(dio: Dio()),
            ),
          ),
        )..add(FetchChapters(book.id ?? '')),
        child: Scaffold(
          appBar: AppBar(
            title: Text(book.name ?? ''),
            backgroundColor: Colors.blue,
          ),
          body: BlocBuilder<ChaptersBloc, ChaptersState>(
            builder: (context, state) {
              if (state is ChaptersLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ChaptersLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: state.chapters.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          trailing: Icon(Icons.arrow_right),
                          title: Text(
                            '${state.chapters[index].book} - ${state.chapters[index].chapter}',
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is ChaptersError) {
                return Center(child: Text(state.message));
              }
              return Center(child: Text('Press button to fetch chapters'));
            },
          ),
        ),
      ),
    );
  }
}
