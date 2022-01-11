// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(ListaTarefas());
}

class ListaTarefas extends StatefulWidget {
  const ListaTarefas({Key? key}) : super(key: key);

  @override
  _ListaTarefasState createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lista de Tarefas",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
