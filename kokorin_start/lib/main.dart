import 'package:flutter/material.dart';

void main() {
  runApp(myFirstApp());
}

class myFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "FirstAppBar",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearProgressIndicator(value: 35),
                Text(
                  'Procces 35%',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.red,
                  ),
                ),
                Text('Press the button',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(
            Icons.download_done_rounded,
          ),
        ),
      ),
    );
  }
}
