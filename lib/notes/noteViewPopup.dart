import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteViewPopup extends StatefulWidget {
  const NoteViewPopup({Key? key, required this.lesson, required this.note})
      : super(key: key);

  final String lesson;
  final String note;

  @override
  _NoteViewPopupState createState() => _NoteViewPopupState();
}

class _NoteViewPopupState extends State<NoteViewPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.lesson),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(widget.note)],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Close")),
      ],
    );
  }
}
