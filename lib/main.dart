import 'package:flutter/material.dart';
import 'package:git_book/Screens/main_screen.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Git Book';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
