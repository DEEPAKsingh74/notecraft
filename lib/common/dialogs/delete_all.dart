import 'package:flutter/material.dart';
import 'package:notecraft/data/cubit/note_cubit.dart';
import 'package:notecraft/data/database/database_helper.dart';
import 'package:notecraft/data/models/note_model.dart';

void deleteAllTemporaryNotes(
    BuildContext context, List<Note>? notes, NoteCubit noteCubit) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmation'),
        content: const Text(
            'Are you sure you want to delete all notes permamently?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () async {
              if (notes != null) {
                for (Note note in notes) {
                  if (note.isDeleted == 1) {
                    await DatabaseHelper.deleteNote(note.id!);
                    noteCubit.deleteNote(note.id!);
                  }
                }
              }
              Navigator.of(context).pop();
            },
            child: const Text('Delete ALL'),
          ),
        ],
      );
    },
  );
}
