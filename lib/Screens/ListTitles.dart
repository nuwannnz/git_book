import 'dart:convert';
import 'package:git_book/notes/noteList.dart';
import 'package:git_book/notes/notePopup.dart';

import 'TitleBody.dart';
import 'package:flutter/material.dart';

class ListTitles extends StatefulWidget {
  @override
  _ListTitlesState createState() => _ListTitlesState();
}

class _ListTitlesState extends State<ListTitles> {
  Future<void> _addNewNoteClick(BuildContext context, String lesson) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return NotePopup(lesson: lesson);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn GitHub here.."),
        actions: [
          IconButton(
            icon: const Icon(Icons.book),
            tooltip: 'View notes',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new NoteList()));
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 40, top: 10, bottom: 10),
                      child: ListTile(
                        title: Text(showData[index]['title']),
                        subtitle: Text(showData[index]['subtitle']),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Body(index)));
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 5,
                      child: Material(
                        color: Colors.transparent,
                        child: Center(
                          child: Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.amberAccent,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              color: Colors.white,
                              onPressed: () async {
                                await _addNewNoteClick(
                                    context, showData[index]['title']);
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ));
              },
              itemCount: showData.length,
            );
          },
          future: DefaultAssetBundle.of(context)
              .loadString("assets/bodyDetails.json"),
        ),
      ),
    );
  }
}
