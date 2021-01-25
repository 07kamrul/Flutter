import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screen/MyHomePage.dart';
import 'package:todo_app/screen/todo_model_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        builder: (context) => TodoModel(),
        child: MyHomePage(),
      ),
    );
  }
}
