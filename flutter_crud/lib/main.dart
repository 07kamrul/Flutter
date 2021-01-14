import 'package:flutter/material.dart';
import 'package:flutter_crud/screen/home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.grey,

    ),
    debugShowCheckedModeBanner: false,
    home: Home(),

  ));
}
