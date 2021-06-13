

import 'dart:convert';
import 'TitleBody.dart';
import 'package:flutter/material.dart';

class ListTitles extends StatefulWidget {

  @override
  _ListTitlesState createState() => _ListTitlesState();
}

class _ListTitlesState extends State<ListTitles> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Learn GitHub here.."),),
      body: Center(
        child: FutureBuilder(builder: (context, snapshot) {
          var showData = json.decode(snapshot.data.toString());
          return ListView.builder(
           
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(showData[index]['title']),
                  subtitle: Text(showData[index]['subtitle']),
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Body(index))
                     );
                  },
                ),
                
              );
            },
             itemCount: showData.length,

          );
        }, future: DefaultAssetBundle.of(context).loadString("assets/bodyDetails.json"),
        ),
      ),
    );
  }
}