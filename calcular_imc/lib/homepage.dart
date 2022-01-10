// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_final_fields
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String infoText = "Informe seus dados!";
  String formatPeso = "";

  void restartar() {
    pesoController.text = "";
    alturaController.text = "";
    infoText = "Informe seus dados!";
    _formKey = GlobalKey<FormState>();
    setState(() {});
  }

  void _calcularImc() {
    double peso =
        double.parse(pesoController.text.toString().replaceAll(',', '.'));
    double altura = double.parse(alturaController.text) / 100;
    double calculoImc = 0;
    //OBS: divide por 100 por conta que está em centímetros

    calculoImc = (peso / (altura * altura));

    if (calculoImc < 18.5) {
      infoText = "${calculoImc.toStringAsFixed(2)}\nAbaixo do Peso.";
    } else if (calculoImc >= 18.6 && calculoImc < 25) {
      infoText = "${calculoImc.toStringAsFixed(2)}\nPeso Normal.";
    } else if (calculoImc >= 25 && calculoImc < 30) {
      infoText = "${calculoImc.toStringAsFixed(2)}\nSobrepeso.";
    } else if (calculoImc >= 30 && calculoImc < 35) {
      infoText = "${calculoImc.toStringAsFixed(2)}\nObesidade Grau I.";
    } else if (calculoImc >= 35 && calculoImc < 40) {
      infoText = "${calculoImc.toStringAsFixed(2)}\nObesidade Grau II.";
    } else if (calculoImc >= 40) {
      infoText =
          "${calculoImc.toStringAsFixed(2)}\nObesidade Grau III ou Mórbida.";
    } else {
      infoText = "Cálculo não validado!";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: restartar,
            icon: Icon(Icons.keyboard_return),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.person_outline,
                  size: 120,
                  color: Colors.green,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Informe o peso!";
                    } else {}
                  },
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Peso (Kg)",
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Informe a altura";
                    } else {}
                  },
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calcularImc();
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Text(
                  infoText,
                  style: TextStyle(fontSize: 30, color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
