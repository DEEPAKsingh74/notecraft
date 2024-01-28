import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notecraft/data/cubit/note_cubit.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late final NoteCubit noteCubit;

  @override
  void initState() {
    noteCubit = BlocProvider.of<NoteCubit>(context);
    super.initState();
  }

  void searchNotes(String query) {
      noteCubit.searchNote(query);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 340,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            90,
          ),
          border: Border.all(
            color: Colors.amber,
            width: 2.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 10,
            ),
            const Icon(Icons.search),
            SizedBox(
              height: 50,
              width: 280,
              child: TextField(
                onChanged: (value) {
                  searchNotes(value);
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search form your notes",
                ),
              ),
            )
          ],
        ));
  }
}
