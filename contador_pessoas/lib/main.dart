// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const ContadorPessoas());
}

class ContadorPessoas extends StatelessWidget {
  const ContadorPessoas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contador de Pessoas",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
