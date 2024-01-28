import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:notecraft/data/cubit/note_cubit.dart';
import 'package:notecraft/data/database/database_helper.dart';
import 'package:notecraft/data/models/note_model.dart';

class EditScreen extends StatefulWidget {
  final Note? note;
  const EditScreen({
    super.key,
    this.note,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _controller;
  late QuillController _quillController;
  late NoteCubit noteCubit;

  @override
  void initState() {
    if (widget.note != null) {
      _controller = TextEditingController(text: widget.note!.title);
      _quillController = QuillController(
        document: Document.fromJson([
          {"insert": widget.note!.description}
        ]),
        selection: const TextSelection.collapsed(offset: 0),
      );
    } else {
      _controller = TextEditingController();
      _quillController = QuillController.basic();
    }

    noteCubit = BlocProvider.of<NoteCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void insertNote() async {
    final String title = _controller.text;
    final String description = _quillController.document.toPlainText();

    if (title.isEmpty || description.isEmpty) {
      return;
    }

    final Note note =
        Note(id: widget.note?.id, title: title, description: description);

    if (widget.note == null) {
      await DatabaseHelper.addNote(note);
      noteCubit.addNote(note);
    } else {
      await DatabaseHelper.updateNote(note);
      noteCubit.updateNote(note);
    }
    context.pop();
  }

  void deleteNote(Note note) async {
    await DatabaseHelper.deleteRestoreNoteTemporary(note, 1);
    noteCubit.deleteNote(note.id!);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                if (widget.note != null) {
                  deleteNote(widget.note!);
                }
              },
              icon: Icon(
                FontAwesomeIcons.trash,
                size: 20,
                color: (widget.note != null)
                    ? Colors.redAccent
                    : const Color.fromARGB(255, 133, 133, 133),
              ),
            ),
            IconButton(
              onPressed: () {
                insertNote();
              },
              icon: const Icon(
                FontAwesomeIcons.floppyDisk,
                size: 20,
                color: Color.fromARGB(255, 7, 225, 120),
              ),
            )
          ],
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, left: 16, bottom: 8, right: 8),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter the title",
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "8 January 7:34 AM",
                    style: TextStyle(
                      color: Color.fromARGB(147, 18, 18, 18),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: QuillProvider(
                  configurations: QuillConfigurations(
                    controller: _quillController,
                    sharedConfigurations: const QuillSharedConfigurations(
                      locale: Locale('en'),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: QuillEditor.basic(
                          configurations: const QuillEditorConfigurations(
                            readOnly: false,
                            placeholder: "Type your notes here..",
                            showCursor: true,
                          ),
                        ),
                      ),
                      const QuillToolbar(
                        configurations: QuillToolbarConfigurations(
                          multiRowsDisplay: false,
                          color: Color.fromARGB(255, 206, 206, 206),
                          toolbarSize: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
