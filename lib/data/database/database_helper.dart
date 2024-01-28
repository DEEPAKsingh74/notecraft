import 'package:notecraft/data/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int version = 3;
  static const String _dbName = "notes.db";

  static Future<Database> _getDB() async {
    String path = join(await getDatabasesPath(), _dbName);
    return openDatabase(path,
        onCreate: (db, version) async =>
            await db.execute('''CREATE TABLE Notes (
                id INTEGER PRIMARY KEY AUTOINCREMENT, 
                title TEXT,  
                description TEXT, 
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                isDeleted INTEGER DEFAULT 0 
              )'''),
        version: version);
  }

  static Future<int> addNote(Note note) async {
    final db = await _getDB();
    return await db.insert("Notes", note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateNote(Note note) async {
    final db = await _getDB();
    return await db.update(
      "Notes",
      note.toJson(),
      where: "id = ?",
      whereArgs: [note.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteRestoreNoteTemporary(Note note, int deleteType) async {
    final db = await _getDB();

    final deleteTemp = note.copyWith(
      isDeleted: deleteType
    );
    return await db.update(
      "Notes",
      deleteTemp.toJson(),
      where: "id = ?",
      whereArgs: [note.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteNote(int id) async {
    final db = await _getDB();
    return await db.delete(
      "Notes",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<List<Note>?> getAllNotes() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> notes = await db.query("Notes");

    if (notes.isEmpty) {
      return null;
    }

    return List.generate(notes.length, (index) => Note.fromJson(notes[index]));
  }
}
