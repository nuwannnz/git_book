import 'package:flutter/material.dart';

import 'dart:js';
import 'dart:convert';


class Body extends StatelessWidget {
  final int id;
  Body(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
                  child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(builder: (context, snapshot) {
              var showData = json.decode(snapshot.data.toString());

             List<dynamic> entitlements = showData[id]['body'];

              //List<dynamic> entitlements = showData[id]['test'];

              return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       Padding(
                        padding: EdgeInsets.all(35),
                        child: Row(
                          children: <Widget>[
                            Text(
                              showData[id]['title'],
                              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      
                        Container(
                        child:  Column(
                          mainAxisAlignment : MainAxisAlignment.center,
                           children: <Widget>[
                            Align(
                              
                              alignment: Alignment.center,
                              child: Image.network(
                                showData[id]['imageURL'],
                                fit: BoxFit.contain,
                                width: 300,
                                height: 150,
                              ),
                            ),
                          ],
                        )
                        ),
                      SingleChildScrollView(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          
                          mainAxisAlignment : MainAxisAlignment.start,
                          children: entitlements.map((item) => new Text(item['para'] + ' \n', style: TextStyle(
                            fontSize: 14,
                            fontWeight: item['style'] == "bold" ? FontWeight.bold : FontWeight.normal,
                            fontStyle: item['style'] == "italic" ? FontStyle.italic : FontStyle.normal,
                          ), textAlign:  TextAlign.justify,)).toList())
                        ),

                       // child:  Column(mainAxisAlignment : MainAxisAlignment.center, children:  entitlements.map((item) => new Text(item.toString() + ' \n', textAlign: TextAlign.justify)).toList())
                        
                       
                    
                    ]
                  )
               

               
                
              );
              }, future: DefaultAssetBundle.of(context).loadString("assets/bodyDetails.json"),
              )
            ),
        )
        );
  }
}
