// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'screens/login_page.dart';

void main() {
  runApp(MyAppMobx());
}

class MyAppMobx extends StatefulWidget {
  const MyAppMobx({Key key}) : super(key: key);

  @override
  State<MyAppMobx> createState() => _MyAppMobxState();
}

class _MyAppMobxState extends State<MyAppMobx> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyApp Mobx",
      home: LoginPage(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
        ),
      ),
    );
  }
}
