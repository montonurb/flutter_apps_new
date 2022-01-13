// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_collection_literals, prefer_final_fields, prefer_void_to_null, curly_braces_in_flow_control_structures
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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final tarefaController = TextEditingController();

  List _toDoList = [];
  Map<String, dynamic> _lastRemoved = Map();
  late int _lastRemovedPos;

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      _toDoList = jsonDecode(data);
      setState(() {});
    });
  }

  void _addToDo() {
    Map<String, dynamic> newToDo = Map();
    newToDo["title"] = tarefaController.text;
    tarefaController.text = "";
    newToDo["done"] = false;
    _toDoList.add(newToDo);
    setState(() {});
    _saveData();
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));
    _toDoList.sort((a, b) {
      if (a["done"] && !b["done"])
        return 1;
      else if (!a["done"] && b["done"])
        return -1;
      else
        return 0;
    });
    _saveData();
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Tarefas"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(17, 1, 17, 1),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        //padding: const EdgeInsets.only(right: 25),
                        child: TextFormField(
                          controller: tarefaController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Informa a tarefa!";
                            } else {}
                          },
                          decoration: InputDecoration(
                              labelText: "Nova Tarefa:",
                              labelStyle: TextStyle(
                                color: Colors.blueAccent,
                              )),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addToDo();
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        primary: Colors.cyan,
                      ),
                      child: Text(
                        "ADD",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: _toDoList.length,
                    itemBuilder: buildItem,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "Excluir",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        secondary: CircleAvatar(
          child: Icon(_toDoList[index]["done"] ? Icons.check : Icons.error),
        ),
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["done"],
        onChanged: (check) {
          _toDoList[index]["done"] = check;
          _saveData();
          setState(() {});
        },
      ),
      onDismissed: (direction) {
        _lastRemoved = Map.from(_toDoList[index]);
        _lastRemovedPos = index;
        _toDoList.removeAt(index);
        _saveData();
        setState(() {});
        final snack = SnackBar(
          content: Text("Tarefa \"${_lastRemoved["title"]}\" removida."),
          action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                _toDoList.insert(_lastRemovedPos, _lastRemoved);
                _saveData();
                setState(() {});
              }),
          duration: Duration(seconds: 5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snack);
      },
    );
  }

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
}
