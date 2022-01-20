// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:myapp_mobx/widgets/custom_icon_button.dart';
import 'package:myapp_mobx/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void _logar() {
    print("Logando");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTextField(
                      obscure: false,
                      controller: userController,
                      hint: "E-mail",
                      prefix: Icon(
                        Icons.account_circle,
                        color: Colors.deepPurpleAccent,
                        size: 32,
                      ),
                      onChanged: (email) {},
                      enabled: true,
                    ),
                    CustomTextField(
                      obscure: true,
                      controller: passController,
                      hint: "Senha",
                      prefix: Icon(
                        Icons.lock,
                        color: Colors.deepPurpleAccent,
                        size: 32,
                      ),
                      suffix: CustomIconButton(
                        radius: 32,
                        iconData: Icons.visibility,
                        onTap: () {},
                      ),
                      onChanged: (pass) {},
                      enabled: true,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.white,
                          textStyle: TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: _logar,
                      child: Text("Logar"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
