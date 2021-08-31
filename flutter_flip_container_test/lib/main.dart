import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? _showFrontSide;
  bool? _flipXAxis;
  List<Prototype> prototypeList = [];

  void addPrototype () {
    for (int i = 0; i == 3; i++) {
      prototypeList.add(Prototype());
    }
  }

  @override
  void initState() {
    _showFrontSide = true;
    _flipXAxis = true;
    addPrototype();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.tight(
            Size.square(100.0),
          ),
          child: _buildFlipAnimation(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeRotationAxis,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _changeRotationAxis() {
    setState(() {
      _flipXAxis = !_flipXAxis!;
    });
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide!;
    });
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: _transitionBuilder,
        child: _showFrontSide! ? _buildFirstSide() : _buildSecondSide(),
      ),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
        animation: rotateAnim,
        child: widget,
        builder: (context, widget) {
          final isUnder = (ValueKey(_showFrontSide) != widget!.key);
          var titl = ((animation.value - 0.5).abs() - 0.5) * 0.003;
          titl *= isUnder ? -1.0 : 1.0;
          final value =
              isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
          return Transform(
            transform: _flipXAxis!
                ? (Matrix4.rotationY(value)..setEntry(3, 0, titl))
                : (Matrix4.rotationX(value)..setEntry(3, 1, titl)),
            child: widget,
            alignment: Alignment.center,
          );
        });
  }

  Widget _buildFirstSide() {
    return _buildLayout(
      key: ValueKey(true),
      backgroundColor: Colors.blue,
      faceName: 'Front',
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child: FlutterLogo(),
        ),
      ),
    );
  }

  Widget _buildSecondSide() {
    return _buildLayout(
        key: ValueKey(false),
        backgroundColor: Colors.red,
        faceName: 'Rear',
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
            child: Center(
              child: Text(
                'Flutter',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
        ));
  }

  Widget _buildLayout(
      {Key? key, Widget? child, String? faceName, Color? backgroundColor}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          faceName!.substring(0, 1),
          style: TextStyle(fontSize: 80.0),
        ),
      ),
    );
  }

}

class Prototype{
  String firstSide = 'F';
  String secondSide = 'S';
  static  int count = 0;

  Prototype(){
    count++;
    firstSide += '$count';
    secondSide += '$count';
  }

}