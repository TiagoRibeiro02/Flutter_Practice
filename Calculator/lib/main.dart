import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new buttonPressed(),
    );
  }
}


class buttonPressed extends StatefulWidget {
  const buttonPressed({super.key});

  @override
  State<buttonPressed> createState() => _buttonPressedState();
}

class _buttonPressedState extends State<buttonPressed> {

  String output = '0';
  String _output = '0';
  String view = '0';
  String operand = '';
  String newop = '';
  String auxop = '';
  double num1 = 0;
  double num2 = 0;
  int count = 0;
  bool vis = false;
  int buttonPressedTwice = 0;
  double aux = 0;
  String auxdel = '';

  void buttonpressed(String buttonText) async {

    if(buttonText == 'C'){
      output = '0';
      _output = '0';
      view = '0';
      operand = '';
      num1 = 0;
      num2 = 0;
      vis = false;
      count = 0;
      buttonPressedTwice = 0;
      aux = 0;
      auxop = '';
    }
    else if(buttonText == '+' || buttonText == '-' || buttonText == '/' || buttonText == 'x' ){
      buttonPressedTwice += 1;
      if(buttonPressedTwice == 1) {
        num1 = double.parse(output);
        operand = buttonText;
        _output = '0';
        view = view + buttonText;
        vis = false;
      }else{
        num2 = double.parse(output);
        auxdel = '0' + num2.toString();
        if(operand == '+'){
          if(buttonText == 'x' || buttonText == '/'){
            aux = num1;
            auxop = '+';
            num1 = num2;
            view = view + buttonText;
            _output = '0';
            newop = buttonText;
          }else {
            num1 = (num1 + num2);
            view = view + buttonText;
            _output = '0';
            newop = buttonText;
          }
        }
        if(operand == '-'){
          if(buttonText == 'x' || buttonText == '/'){
            aux = num1;
            auxop = '-';
            num1 = num2;
            view = view + buttonText;
            _output = '0';
            newop = buttonText;
          }else {
            num1 = (num1 - num2);
            view = view + buttonText;
            _output = '0';
            newop = buttonText;
          }
        }
        if(operand == '/'){
          if(num2 == 0.0){
            view = 'Error: Division by 0';
          }else {
            if(auxop == '+') {
              num1 = aux+(num1 / num2);
              view = view + buttonText;
              _output = '0';
              newop = buttonText;
            }else if(auxop == '-') {
              num1 = aux-(num1 / num2);
              view = view + buttonText;
              _output = '0';
              newop = buttonText;
            }else{
              num1 = (num1 / num2);
              view = view + buttonText;
              _output = '0';
              newop = buttonText;
            }
          }
        }
        if(operand == 'x'){
          if(auxop == '+') {
            num1 = aux+(num1 * num2);
            view = view + buttonText;
            _output = '0';
            newop = buttonText;
          }else if(auxop == '-') {
            num1 = aux-(num1 * num2);
            view = view + buttonText;
            _output = '0';
            newop = buttonText;
          }else{
            num1 = (num1 * num2);
            view = view + buttonText;
            _output = '0';
            newop = buttonText;
          }
        }
        operand = newop;
      }

    }
    else if(buttonText == '='){
      num2 = double.parse(output);
      auxdel = '0' + num2.toString();
      //print(num2);
      view = view + '=';
      if(operand == '+'){
        _output =(num1 + num2).toString();
        vis = true;
      }
      if(operand == '-'){
        _output = (num1 - num2).toString();
        vis = true;
      }
      if(operand == '/'){
        if(num2 == 0.0){
          view = 'Error: Division by 0';
        }else {
          if(auxop == '+') {
            _output = (aux + (num1 / num2)).toString();
            vis = true;
          }else if(auxop == '-'){
            _output = (aux - (num1 / num2)).toString();
            vis = true;
          }else{
            _output = (num1 / num2).toString();
            vis = true;
          }
        }
      }
      if(operand == 'x'){
        if(auxop == '+') {
          _output = (aux + (num1 * num2)).toString();
          vis = true;
        }else if(auxop == '-'){
          _output = (aux - (num1 * num2)).toString();
          vis = true;
        }else{
          _output = (num1 * num2).toString();
          vis = true;
        }
      }
      if(operand == ''){
        num1 = double.parse(output);
        _output = num1.toString();
        vis = true;
      }

      num1 = 0;
      num2 = 0;
      operand = '';

    }

    else if(buttonText == '%'){
      if(buttonPressedTwice == 0){
        num1 = double.parse(output);
        _output = (num1 / 100).toString();
        view = _output;
      }else{
        num2 = double.parse(output);
        _output = (num2 / 100).toString();
        view = view.substring(0, (view.length - (num2.toString().length-2)).toInt()) + _output;
        num2 = num2/100;
        auxdel = '0' + num2.toString();
      }
    }

    else if(buttonText == '.'){
      if(_output.contains('.')){
        print('already contains .');
      }
      else{
        _output = _output + buttonText;
        view = view + buttonText;
      }
    }
    else if(buttonText == 'del'){
      if(_output == '0'  || _output == ''){
        view = view.substring(0, view.length -1);
        num2=0;
        if(view == ''){
          num1 = 0;
          view = '0';
        }
        _output = '0';
      }else if(view.contains('=')){}
      else {
        if(auxdel == '' || auxdel == '0'){
          num2 = 0;
          auxdel = '0';
          _output = '0';
        }else {
          auxdel = auxdel.substring(0, auxdel.length - 1);
          print('auxdel: $auxdel');
          num2 = num2 = double.parse(auxdel);
          print('n2: $num2');
        }
        _output = _output.substring(0, _output.length - 1);
        view = view.substring(0, view.length - 1);
      }
    }
    else if(buttonText == '√'){
      if(buttonPressedTwice == 0) {
        num1 = double.parse(output);
        _output = '0'+((sqrt(num1)).toString());
        view = view.substring(0, (view.length - (num1.toString().length-2)).toInt()) + _output;
        //vis = true;
      }else{
        num2 = double.parse(output);
        _output = '0'+(sqrt(num2)).toString();
        view = view = view.substring(0, (view.length - (num2.toString().length-2)).toInt()) + _output.substring(1,_output.length);
        num2 = sqrt(num2);
        auxdel = '0' + num2.toString();
      }
    }
    else{
      _output = _output + buttonText;
      view = view + buttonText;
      if(count == 0){
        view = _output.substring(1, view.length);
        count += 1;
      }

    }

    print('_output: $_output');
    print('num1: $num1');
    print('aux: $aux');
    print('num2: $num2');

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
      //print(output);
    });
  }

  Widget buildButton(String text){
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
          //backgroundColor: MaterialStateProperty.all(Colors.amber),
          padding: MaterialStateProperty.all(EdgeInsets.all(24.0)),
        ),
      onPressed: () {buttonpressed(text);},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
            children:[
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 12.0
                  ),
                  child: Text(view, style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,

                  ))),
              Visibility(
                visible: vis,
                child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0
                    ),
                    child: Text(output, style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,

                    ))),
              ),
              Expanded(
                child: Divider(),
              ),


              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildButton('C'),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: ButtonStyle(
                            //backgroundColor: MaterialStateProperty.all(Colors.amber),
                            padding: MaterialStateProperty.all(EdgeInsets.all(24.0)),
                          ),
                          onPressed: () {buttonpressed('del');},
                          icon: Icon(
                            Icons.backspace,
                            size: 28.0,
                          ),
                          label: Text(''),
                        ),
                      ),
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
                      buildButton('√'),
                      buildButton('0'),
                      buildButton('.'),
                      buildButton('='),

                    ],
                  ),
                ],
              )
            ]));
  }
}

