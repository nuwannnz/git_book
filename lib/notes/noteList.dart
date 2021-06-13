import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_book/main.dart';
import 'package:git_book/notes/noteDeletePopup.dart';
import 'package:git_book/notes/notePopup.dart';
import 'package:git_book/notes/noteViewPopup.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My notes"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('notes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            children: snapshot.data!.docs
                .map(
                  (note) => GestureDetector(
                      onTap: () async {
                        // await _noteTap(
                        //     context, note.id, note['Note'], note['lesson']);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: NoteListItem(
                          lesson: note['lesson'],
                          note: note['Note'],
                          noteId: note.id,
                        ),
                      )),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class NoteListItem extends StatelessWidget {
  NoteListItem(
      {Key? key,
      required this.noteId,
      required this.lesson,
      required this.note})
      : super(key: key);

  final String lesson;
  final String note;
  final String noteId;

  Future<void> _noteTap(
      BuildContext context, String noteId, String note, String lesson) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return NotePopup(
            lesson: lesson,
            note: note,
            noteId: noteId,
          );
        });
  }

  Future<void> _deleteTap(BuildContext context, String noteId) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return NoteDeletePopup(
            noteId: noteId,
          );
        });
  }

  Future<void> _viewTap(
      BuildContext context, String lesson, String note) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return NoteViewPopup(lesson: lesson, note: note);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(240, 240, 240, 1),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 2.0,
              ),
            ]),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // text section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(note),
              ],
            ),
            // actions section
            Row(children: [
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.lightBlue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          color: Colors.white,
                          onPressed: () async {
                            await _viewTap(context, lesson, note);
                          },
                        ),
                      ),
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.amberAccent,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.white,
                          onPressed: () async {
                            await _noteTap(context, noteId, note, lesson);
                          },
                        ),
                      ),
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.red,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.white,
                          onPressed: () async {
                            await _deleteTap(context, noteId);
                          },
                        ),
                      ),
                    ),
                  ))
            ])
          ],
        ));
  }
}
