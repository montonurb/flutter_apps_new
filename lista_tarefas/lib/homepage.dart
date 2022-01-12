// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController tarefaController = TextEditingController();

  List _toDoList = [];

  Future<File> _getFile() async {
    final directory = await getApplicationSupportDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = jsonEncode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return "Error!";
    }
  }

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
                      controller: tarefaController,
                      decoration: InputDecoration(
                          labelText: "Nova Tarefa:",
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                          )),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      primary: Colors.cyan,
                    ),
                    child: Text("ADD"),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: _toDoList.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    secondary: CircleAvatar(
                      child: Icon(_toDoList[index]["checked"]
                          ? Icons.check
                          : Icons.error),
                    ),
                    title: Text(_toDoList[index]["title"]),
                    value: _toDoList[index]["done"],
                    onChanged: null,
                  );
                },
              ),
            )
          ],
        ));
  }
}
