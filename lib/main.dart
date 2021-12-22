// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, camel_case_types, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:test_websocket/views/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yemek Kitabı',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.white,
        textTheme: TextTheme(
            bodyText2: TextStyle(
          color: Colors.white60,
        )),
      ),
      home: HomePage(),
    );
  }
}
