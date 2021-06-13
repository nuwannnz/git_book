import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:git_book/Screens/main_screen.dart';
import 'package:git_book/Screens/ListTitles.dart';
import 'package:git_book/notes/noteList.dart';
import 'package:git_book/notes/notePopup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Git Book';

  Future<void> _addNewNoteClick(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return NotePopup(lesson: "lesson");
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
