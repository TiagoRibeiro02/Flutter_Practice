import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      }
    )
  );
}
