// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<Map> getData() async {
  var url =
      Uri.parse("https://api.hgbrasil.com/finance?format=json&key=11d3b830");
  var response = await http.get(url);
  return jsonDecode(response.body);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  late double dolar;
  late double euro;

  _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  "Carregando Dados...",
                  style: TextStyle(fontSize: 25, color: Colors.amber),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Erro ao Carregando os Dados :(",
                    style: TextStyle(fontSize: 25, color: Colors.amber),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                //real = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                dolar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];
                return SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 150,
                        color: Colors.amber,
                      ),
                      Divider(),
                      buildTextField(
                          realController, "Reais", "R\$ ", _realChanged),
                      Divider(),
                      buildTextField(
                          dolarController, "Dólares", "US\$ ", _dolarChanged),
                      Divider(),
                      buildTextField(
                          euroController, "Euros", "€ ", _euroChanged)
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

buildTextField(TextEditingController moedaController, String label,
    String prefix, Function(String) calcularMoeda) {
  return TextField(
    style: TextStyle(color: Colors.amber),
    onChanged: calcularMoeda,
    controller: moedaController,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      prefixText: prefix,
    ),
    keyboardType: TextInputType.number,
  );
}
