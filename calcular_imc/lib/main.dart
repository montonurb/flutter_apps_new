// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(CalcularImc());
}

class CalcularImc extends StatefulWidget {
  const CalcularImc({Key? key}) : super(key: key);

  @override
  _CalcularImcState createState() => _CalcularImcState();
}

class _CalcularImcState extends State<CalcularImc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
