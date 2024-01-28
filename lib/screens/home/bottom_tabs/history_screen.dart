import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notecraft/common/dialogs/delete_all.dart';
import 'package:notecraft/common/dialogs/restore_all.dart';
import 'package:notecraft/common/search_bar.dart';
import 'package:notecraft/data/cubit/note_cubit.dart';
import 'package:notecraft/screens/home/tabs/notes_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final noteCubit = BlocProvider.of<NoteCubit>(context);
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("History"),
          actions: [
            IconButton(
              onPressed: () {
                restoreAllNotes(
                  context,
                  noteCubit.getAllNotes(),
                  noteCubit,
                );
              },
              icon: const Icon(
                FontAwesomeIcons.clockRotateLeft,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.redAccent, width: 2.0),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  deleteAllTemporaryNotes(
                      context, noteCubit.getAllNotes(), noteCubit);
                },
                child: const Text(
                  "Delete all",
                ),
              ),
            ),
          ],
        ),
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(14.0),
              child: SearchInput(),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: NotesScreen(isDeleted: 1),
            ),
          ],
        ),
      ),
    );
  }
}
