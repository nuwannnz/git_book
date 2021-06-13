import 'package:flutter/material.dart';
import 'aboutUs.dart';
import 'myProfile.dart';

void main() {
  runApp(MaterialApp(
    title: 'Git Book',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffa726), 
        title: Text('Git Book'),
      ),
      body: 
        Column(
          children: [
             Center(
        child: ElevatedButton(
          child: Text('About Us'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUs()),
            );
          },
        ),
      ),
       Center(
        child: ElevatedButton(
          child: Text('MyProfile'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyProfile()),
            );
          },
        ),
      ),
          ],
        )
       
      
    );
  }
}