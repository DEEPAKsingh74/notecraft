import 'package:flutter/material.dart';
import 'package:notecraft/data/cubit/note_cubit.dart';
import 'package:notecraft/data/database/database_helper.dart';
import 'package:notecraft/data/models/note_model.dart';

void restoreAllNotes(
    BuildContext context, List<Note>? notes, NoteCubit noteCubit) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Are you sure you want to restore all?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (notes != null) {
                for (Note note in notes) {
                  if (note.isDeleted == 1) {
                    await DatabaseHelper.deleteRestoreNoteTemporary(
                      note,
                      0,
                    );
                    noteCubit.restoreNote(note);
                  }
                }
              }
              Navigator.of(context).pop();
            },
            child: const Text('Restore ALL'),
          ),
        ],
      );
    },
  );
}
