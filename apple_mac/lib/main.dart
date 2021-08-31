import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Mac App",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.lightBlueAccent,
          centerTitle: true,
          title: Text("Apple_Macbook"),
        ),
        body: Container(
          child: Image(
            image: AssetImage("images/g.webp")
          ),
        ),
      ),
    ),
  );
}
