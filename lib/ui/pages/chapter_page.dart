import 'package:flutter/material.dart';
import 'package:flutter_bible_app/domain/entities/verse_entity.dart';

class ChapterPage extends StatelessWidget {
  final List<Verse> verses;

  const ChapterPage({super.key, required this.verses});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(verses[0].bookId ?? '')),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Text(verses[index].text ?? '');
          },
        ),
      ),
    );
  }
}
