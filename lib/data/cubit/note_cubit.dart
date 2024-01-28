import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notecraft/data/models/note_model.dart';

class NoteCubit extends Cubit<List<Note>> {
  NoteCubit() : super([]);

  void addNote(Note note) {
    emit([...state, note]);
  }

  void emitAllNotes() {
    emit(state);
  }

  List<Note>? getAllNotes() {
    return state;
  }

  Note? getNote(int id) {
    for (Note note in state) {
      if (note.id == id) {
        return note;
      }
    }
    return null;
  }

  void getOneNote(int id) {
    emit(state
        .where((parseNote) => parseNote.id == id)
        .map((parseNote) => parseNote)
        .toList());
  }

  void updateNote(Note note) {
    emit(state.map((parseNote) {
      if (parseNote.id == note.id) {
        return parseNote.copyWith(
          title: note.title,
          description: note.description,
          updated_at: '22-jan-2024',
        );
      }
      return parseNote;
    }).toList());
  }

  void restoreNote(Note note) {
    emit(state.map((parseNote) {
      if (parseNote.id == note.id) {
        return parseNote.copyWith(isDeleted: 0);
      }
      return parseNote;
    }).toList());
  }

  void deleteNote(int id) {
    emit(state.where((parseNote) => parseNote.id != id).toList());
  }

  void searchNote(String query) {
    if (query.isEmpty) {
      print("@@@@@@@@@@@@@@@@@  EMPTY STATE");
      for (Note note in state) {
        print(note.title + "@@@@@@@@@@@@@@@@@@@@@@@@ ");
      }
      emitAllNotes();
      return;
    }
    print("============== QUERY : " + query + "=======================");
    List<Note> temp = [...state];
    List<Note> filterState = temp
        .where((note) =>
            note.title.toLowerCase().contains(query.toLowerCase()) ||
            note.description.toLowerCase().contains(query.toLowerCase()))
        .toList();

    for (Note note in filterState) {
      print(note.title + "******************** ");
    }
    emit([...filterState]);
  }
}
