import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notecraft/common/dialogs/restore_delete.dart';
import 'package:notecraft/data/cubit/note_cubit.dart';
import 'package:notecraft/data/models/note_model.dart';
import 'package:notecraft/screens/edit/edit_screen.dart';

class NoteCard extends StatefulWidget {
  final Note note;
  final int isDeleted;
  const NoteCard({
    super.key,
    required this.note,
    required this.isDeleted,
  });

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  late final NoteCubit noteCubit;

  @override
  void initState() {
    noteCubit = BlocProvider.of<NoteCubit>(context);
    super.initState();
  }

  void displayNote() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: BlocProvider.of<NoteCubit>(context),
          child: EditScreen(
            note: widget.note,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.isDeleted == 0) {
          displayNote();
        } else {
          isDeleteConfirmModel(context, widget.note, noteCubit);
        }
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.note.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 62, 62, 62),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.note.description,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      )),
    );
  }
}
