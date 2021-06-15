import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:git_book/Screens/main_screen.dart';
import 'package:git_book/notes/noteList.dart';
import 'package:git_book/notes/notePopup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:git_book/aboutUs.dart';
import 'package:git_book/myProfile.dart';

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
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'View notes',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new MainScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.book),
            tooltip: 'View notes',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new NoteList()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About us',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new AboutUs()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'My profile',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new MyProfile()));
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
