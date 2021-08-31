import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int numberSound) {
    final player = AudioCache();
    player.play('note$numberSound.wav');
  }

  Expanded buildKey({Color color, int numberSound}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        // color: color,
        onPressed: () {
          playSound(numberSound);
        },
        // child: Text('Click me'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, numberSound: 1),
              buildKey(color: Colors.orange, numberSound: 2),
              buildKey(color: Colors.yellow, numberSound: 3),
              buildKey(color: Colors.green, numberSound: 4),
              buildKey(color: Colors.teal, numberSound: 5),
              buildKey(color: Colors.blue, numberSound: 6),
              buildKey(color: Colors.purple, numberSound: 7),
            ],
          ),
        ),
      ),
    );
  }
}
