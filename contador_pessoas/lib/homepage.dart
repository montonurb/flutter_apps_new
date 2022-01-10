// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int controllerPessoas = 0;
  int pessooasLimite = 10;

  void _decrementar() {
    controllerPessoas--;
    setState(() {});
  }

  void _incrementar() {
    controllerPessoas++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                Text(
                  controllerPessoas >= pessooasLimite
                      ? "Lotado!"
                      : "Pode entrar!",
                  style: TextStyle(
                    fontSize: 40,
                    letterSpacing: 5,
                    fontWeight: FontWeight.w500,
                    color: controllerPessoas >= pessooasLimite
                        ? Colors.red
                        : Colors.white,
                    //backgroundColor: Colors.yellow,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  "$controllerPessoas",
                  style: TextStyle(
                      fontSize: 64,
                      color: controllerPessoas != pessooasLimite
                          ? Colors.white
                          : Colors.red),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: controllerPessoas <= 0
                            ? Colors.white.withOpacity(0.5)
                            : Colors.white,
                        fixedSize: Size(120, 100),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: controllerPessoas != 0 ? _decrementar : null,
                      child: Text(
                        "Saiu",
                        style: TextStyle(
                          fontSize: 25,
                          color: controllerPessoas <= 0
                              ? Colors.black.withOpacity(0.5)
                              : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(120, 100),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: controllerPessoas >= pessooasLimite
                          ? null
                          : _incrementar,
                      child: Text("Entrou",
                          style: TextStyle(
                            fontSize: 25,
                            color: controllerPessoas >= pessooasLimite
                                ? Colors.grey.withOpacity(0.5)
                                : Colors.black,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
