import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _count = 0;
  void tuk() {
    setState(() {
      _count++;
    });
  }

  @override
  void initState() {
    print('Stateful is intit');
  }

  @override
  Widget build(BuildContext context) {
    print('Stateful BUILD ~~~~~~~~~~~~~~~~~~');
    FirstContainer firstContainer = new FirstContainer(textFirstContainer: 'First $_count',);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$_count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              FloatingActionButton(
                onPressed: tuk,
                child: Icon(Icons.plus_one),
              ),
              firstContainer,
            SecondContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
 class FirstContainer extends StatelessWidget{
  String textFirstContainer ;
  FirstContainer({required this.textFirstContainer});
  void initState(){
    print('Firstcontainer INIT');
  }
  @override
   Widget build(BuildContext context){
    print('build FirstContainer');
    return Container(
      width: 100,
      height: 100,
      color: Colors.green,
      child: Text('$textFirstContainer'),
    );
  }
 }
class SecondContainer extends StatelessWidget{
  String _textSecondContainer = 'Second';
  void initState(){
    print('Second container INIT');
  }
  @override
  Widget build(BuildContext context){
    print('build Second Container');
    return Container(
      width: 100,
      height: 100,
      color: Colors.yellow,
      child: Text('$_textSecondContainer'),
    );
  }
}
