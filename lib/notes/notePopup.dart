import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotePopup extends StatefulWidget {
  final String? noteId;
  final String? note;
  final String lesson;

  NotePopup({Key? key, required this.lesson, this.note = '', this.noteId})
      : super(key: key);

  @override
  _NotePopupState createState() => _NotePopupState(note: this.note);
}

class _NotePopupState extends State<NotePopup> {
  final noteCollection = FirebaseFirestore.instance.collection('notes');
  final GlobalKey<FormState> _formKey = GlobalKey();

  late TextEditingController noteContentController;

  bool displayProgress = false;
  String? note;

  _NotePopupState({this.note}) {
    noteContentController = TextEditingController(text: note!);
  }

  String _getActionName() {
    return widget.noteId == null ? 'create' : 'update';
  }

  Future<void> _handleSubmit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      displayProgress = true;
    });

    if (widget.noteId == null) {
      // create note
      await noteCollection
          .add({'lesson': widget.lesson, 'Note': noteContentController.text});
    } else {
      // update note
      await noteCollection
          .doc(widget.noteId)
          .update({'Note': noteContentController.text});
    }

    setState(() {
      displayProgress = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Successfully ' + _getActionName() + 'ed note.')));
    // close bottom popup
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.noteId != null ? 'Update note' : 'Create note'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // note form
          if (!displayProgress)
            Form(
                key: _formKey,
                child: TextFormField(
                  controller: noteContentController,
                  decoration: InputDecoration(hintText: "Enter note here"),
                  validator: (value) {
                    return value!.isEmpty ? 'Note cannot be empty ' : null;
                  },
                )),

          // progress spin
          if (displayProgress) CircularProgressIndicator()
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () async {
              await _handleSubmit(context);
            },
            child: Text(widget.noteId != null ? 'Update note' : 'Create note'))
      ],
    );
  }
}
