import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 4;
  int rightDiceNumber = 6;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child:
            TextButton(
              onPressed: (){
                 setDiceRandom();
              },
              child: Image.asset("images/dice$leftDiceNumber.png"),),
          ),
          Expanded(
            child: TextButton(
              onPressed: (){
                  setDiceRandom();
              },
              child: Image.asset("images/dice$rightDiceNumber.png"),),
          ),
        ],
      ),
    );
  }
  void setDiceRandom (){
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }
}

