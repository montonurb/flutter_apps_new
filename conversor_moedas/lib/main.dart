// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main() async {
  runApp(ConversorMoedas());
}

class ConversorMoedas extends StatefulWidget {
  const ConversorMoedas({Key? key}) : super(key: key);

  @override
  _ConversorMoedasState createState() => _ConversorMoedasState();
}

class _ConversorMoedasState extends State<ConversorMoedas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Conversor de Moedas",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
