import 'package:flutter/material.dart';
import 'package:notecraft/data/cubit/note_cubit.dart';
import 'package:notecraft/data/database/database_helper.dart';
import 'package:notecraft/data/models/note_model.dart';

void isDeleteConfirmModel(BuildContext context,  Note note, NoteCubit noteCubit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to delete this note?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await DatabaseHelper.deleteRestoreNoteTemporary(
                  note,
                  0,
                );
                noteCubit.restoreNote(note);
                Navigator.of(context).pop();
              },
              child: const Text('Restore'),
            ),
            TextButton(
              onPressed: () async {
                await DatabaseHelper.deleteNote(note.id!);
                noteCubit.deleteNote(note.id!);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }