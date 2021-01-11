import 'package:flutter/material.dart';
import 'package:flutter_tutorial/scaffold.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Tutorial",
      home: new ScaffoldPage(),

      routes: <String,WidgetBuilder>{
        '/scaffold': (BuildContext context) => new ScaffoldPage(),

      },
    );
  }
}