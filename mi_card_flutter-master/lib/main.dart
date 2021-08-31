import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage("images/m.jpg"),
                ),
                Text("Maks Ruban",
                  style: TextStyle(
                    fontFamily: "Pacifico",
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),

                ),
                Text("FLUTTER DEVELOPER",
                    style: TextStyle(
                      fontFamily: "SourceSans",
                      fontSize: 20.0,
                      color: Colors.teal.shade100,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,

                    ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                    ),
                    title: Text(
                      "+38 066 712 11 94",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: "SourceSans",
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                 child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal.shade900,
                  ),
                   title: Text(
                     "co1@ukr.net",
                     style: TextStyle(
                       fontSize: 20.0,
                       fontFamily: "SourceSans",
                       color: Colors.teal.shade900,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}