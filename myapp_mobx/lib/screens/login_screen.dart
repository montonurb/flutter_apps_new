// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:myapp_mobx/screens/list_screen.dart';
import 'package:myapp_mobx/stores/login_store.dart';
import 'package:myapp_mobx/widgets/custom_icon_button.dart';
import 'package:myapp_mobx/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  LoginStore loginStore = LoginStore();
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction(
      (_) => loginStore.loggedIn,
      (loggedIn) {
        if (loginStore.loggedIn) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ListScreen()));
        }
      },
    );
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
                    Observer(builder: (_) {
                      return CustomTextField(
                        obscure: false,
                        controller: userController,
                        hint: "E-mail",
                        prefix: Icon(
                          Icons.account_circle,
                          color: Colors.deepPurpleAccent,
                          size: 32,
                        ),
                        onChanged: loginStore.setEmail,
                        enabled: !loginStore.loading,
                      );
                    }),
                    Observer(builder: (_) {
                      return CustomTextField(
                        controller: passController,
                        obscure: !loginStore.showPassword,
                        hint: "Senha",
                        prefix: Icon(
                          Icons.lock,
                          color: Colors.deepPurpleAccent,
                          size: 32,
                        ),
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: loginStore.showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: loginStore.setShowPassword,
                        ),
                        onChanged: loginStore.setPassword,
                        enabled: !loginStore.loading,
                      );
                    }),
                    Observer(
                      builder: (_) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.white,
                              textStyle: TextStyle(fontSize: 16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: loginStore.loginPressed,
                          child: loginStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text("Logar"),
                        );
                      },
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

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
