import 'package:notecraft/data/cubit/note_cubit.dart';
import 'package:notecraft/data/database/database_helper.dart';
import 'package:notecraft/data/models/note_model.dart';

class UpdateBloc {
  final NoteCubit noteCubit;

  UpdateBloc(this.noteCubit);

  Future<int> updateBloc() async {
    List<Note>? notes = await DatabaseHelper.getAllNotes();
    if (notes != null && notes.isNotEmpty) {
      for (Note note in notes) {
        print(note.isDeleted.toString() + " " + note.title);
        noteCubit.addNote(note);
      }

      return notes.length;
    }
    return 0;
  }
}
