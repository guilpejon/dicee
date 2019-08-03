import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicee',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Dicee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _topDiceNumber = 1;
  int _bottomDiceNumber = 1;

  void _rollDices() {
    setState(
      () {
        _topDiceNumber = Random().nextInt(6) + 1;
        _bottomDiceNumber = Random().nextInt(6) + 1;
      },
    );
  }

  void _rollBottomDice() {
    setState(
      () {
        _bottomDiceNumber = Random().nextInt(6) + 1;
      },
    );
  }

  void _rollTopDice() {
    setState(
      () {
        _topDiceNumber = Random().nextInt(6) + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            _rollDices();
          },
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 50, 50, 25),
                  child: FlatButton(
                    onPressed: () {
                      _rollTopDice();
                    },
                    child: Image.asset('images/dice$_topDiceNumber.png'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 25, 50, 50),
                  child: FlatButton(
                    onPressed: () {
                      _rollBottomDice();
                    },
                    child: Image.asset('images/dice$_bottomDiceNumber.png'),
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
