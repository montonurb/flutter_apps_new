// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//import 'dart:convert';
//import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Tarefas"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(17, 1, 7, 1),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Nova Tarefa:",
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                          )),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      primary: Colors.cyan,
                    ),
                    child: Text("ADD"),
                  )
                ],
              ),
            ),
            Text("data"),
          ],
        ));
  }
}
