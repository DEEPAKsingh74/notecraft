import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notecraft/common/display_cards/note_card.dart';
import 'package:notecraft/data/cubit/note_cubit.dart';
import 'package:notecraft/data/models/note_model.dart';

class NotesScreen extends StatefulWidget {
  final int isDeleted;
  const NotesScreen({super.key, required this.isDeleted});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    final noteCubit = BlocProvider.of<NoteCubit>(context);

    return BlocBuilder<NoteCubit, List<Note>>(
      bloc: noteCubit,
      builder: (context, notes) {
        final activeNotes =
            notes.where((note) => note.isDeleted == widget.isDeleted).toList();
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: activeNotes.length,
            itemBuilder: (context, index) {
              return NoteCard(
                isDeleted: widget.isDeleted,
                note: activeNotes[index],
              );
            },
          ),
        );
      },
    );
  }
}

