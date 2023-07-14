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
  String lastSelected = '';
  String result = '';
  String operand = '';
  double num1 = 0;
  double num2 = 0;

  void buttonpressed(String buttonText){

    if(buttonText == 'C'){
      output = '0';
      _output = '0';
      operand = '';
      num1 = 0;
      num2 = 0;
    }
    else if(buttonText == '+' || buttonText == '-' || buttonText == '/' || buttonText == 'x' ){
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    }
    else if(buttonText == '='){
      num2 = double.parse(output);
      if(operand == '+'){
        _output = (num1 + num2).toString();
      }
      if(operand == '-'){
        _output = (num1 - num2).toString();
      }
      if(operand == '/'){
        _output = (num1 / num2).toString();
      }
      if(operand == 'x'){
        _output = (num1 * num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = '';

    }
    else if(buttonText == '%'){
      num1 = double.parse(output);

      _output = (num1 / 100).toString();

      num1 = 0;
    }
    else if(buttonText == '.'){
      if(_output.contains('.')){
        print('already contains .');
      }
      else{
        _output = _output + buttonText;
      }
    }
    else if(buttonText == 'del'){
      if(_output == '0'){

      }else {
        _output = _output.substring(0, _output.length - 1);
      }
    }
    else if(buttonText == '#'){
      print('do nothing');
    }
    else{
      _output = _output + buttonText;
    }

    print(_output);
    print(num1);

    setState(() {

      output = double.parse(_output).toStringAsFixed(2);

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
                  child: Text(output, style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,

                  ))),
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
                      buildButton('#'),
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

