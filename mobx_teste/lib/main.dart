// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        //cursorColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.deepPurpleAccent,
      ),
      home: LoginScreen(),
    );
  }
}
