import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              buildButton('C'),
              buildButton('Clear'),
              buildButton('%'),
              buildButton('/'),

            ],
          ),
          Row(
              children: <Widget>[
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('x'),

              ],
            ),
          Row(
            children: <Widget>[
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('-'),

            ],
          ),
          Row(
            children: <Widget>[
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('+'),

            ],
          ),
          Row(
            children: <Widget>[
              buildButton('#'),
              buildButton('0'),
              buildButton('.'),
              buildButton('='),

            ],
          ),
        ],
      )


    ),
  ));
}


Widget buildButton(String text){
  return Expanded(
    child: OutlinedButton(
      style: ButtonStyle(
        //backgroundColor: MaterialStateProperty.all(Colors.amber),
        padding: MaterialStateProperty.all(EdgeInsets.all(24.0)),
      ),
      onPressed: () {},
      child: Text(text),
    ),
  );
}
