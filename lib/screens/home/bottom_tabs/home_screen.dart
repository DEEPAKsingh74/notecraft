import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notecraft/common/search_bar.dart';
import 'package:notecraft/screens/home/tabs/notes_screen.dart';
import 'package:notecraft/screens/home/tabs/todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 200,
          child: Image.asset(
            "assets/images/logo_no_img.png",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.user,
              size: 20,
            ),
          )
        ],
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchInput(),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.amber,
                    tabs: [
                      Tab(
                        text: "All Notes",
                      ),
                      Tab(
                        text: "TO-DO",
                      )
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        NotesScreen(
                          isDeleted: 0,
                        ),
                        TodoScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
