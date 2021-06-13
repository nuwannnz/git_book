import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDeletePopup extends StatefulWidget {
  const NoteDeletePopup({Key? key, required this.noteId}) : super(key: key);

  final String noteId;
  @override
  _NoteDeletePopupState createState() => _NoteDeletePopupState();
}

class _NoteDeletePopupState extends State<NoteDeletePopup> {
  bool displayProgress = false;
  final noteCollection = FirebaseFirestore.instance.collection('notes');

  Future<void> _handleDelete(BuildContext context) async {
    setState(() {
      displayProgress = true;
    });

    await noteCollection.doc(widget.noteId).delete();

    setState(() {
      displayProgress = false;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Deleted note.')));
    // close bottom popup
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete note'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Text('Delete this note? This cannot be undone!')],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () async {
              await _handleDelete(context);
            },
            child: Text('Delete'))
      ],
    );
  }
}
