// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp_mobx/screens/login_screen.dart';
import 'package:myapp_mobx/stores/list_store.dart';
import 'package:myapp_mobx/widgets/custom_icon_button.dart';
import 'package:myapp_mobx/widgets/custom_text_field.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController controller = TextEditingController();
  final ListStore listStore = ListStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Tarefas",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Observer(builder: (_) {
                          return CustomTextField(
                            controller: controller,
                            obscure: false,
                            hint: "Tarefa",
                            onChanged: listStore.setNewTodoTitle,
                            suffix: CustomIconButton(
                              radius: 32,
                              iconData:
                                  listStore.isFormValid ? Icons.add : null,
                              onTap: () {
                                listStore.addTodo();
                                controller.clear();
                              },
                            ),
                          );
                        }),
                        Expanded(
                          child: Observer(builder: (_) {
                            return ListView.separated(
                              itemCount: listStore.todoList.length,
                              itemBuilder: (context, index) {
                                final todo = listStore.todoList[index];
                                return Observer(builder: (_) {
                                  return ListTile(
                                    title: Text(
                                      "${todo.title}",
                                      style: TextStyle(
                                          decoration: todo.done
                                              ? TextDecoration.lineThrough
                                              : null,
                                          color: todo.done
                                              ? Colors.grey
                                              : Colors.black),
                                    ),
                                    onTap: todo.toggleDone,
                                  );
                                });
                              },
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
