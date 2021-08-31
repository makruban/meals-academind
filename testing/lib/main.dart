import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade100,
        body: Row(
           children: <Widget>[
             SafeArea(child:
             Container(
               width: 100.0,
               height: 100.0,
               padding: EdgeInsets.all(10.0),
               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 80),
               color: Colors.red,
               child: Text(
                 "HELLO",
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
             ),
             ),
             SafeArea(
               child: Container(
                 height: 100.0,
                 width: 100.0,
                 color: Colors.yellow,
               ),
             )
           ]

        ),

      ),
    );
  }
}

