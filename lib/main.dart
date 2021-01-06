import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NiceDice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DicePage(),
    );
  }
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('NiceDice'),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Dice(),
            ),
            Expanded(
              child: Dice(),
            ),
          ],
        ),
      ),
    );
  }
}

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int diceNumber = rollDice();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          diceNumber = rollDice();
          print('Dice number = $diceNumber');
        });
      },
      child: Image.asset('assets/images/dice$diceNumber.png'),
    );
  }

  static int rollDice() {
    int diceNumber = Random().nextInt(6) + 1;
    return diceNumber;
  }
}
