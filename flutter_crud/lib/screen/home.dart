import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_data.dart';
import 'hello.dart';

class Home extends StatefulWidget {
  // Home({Key: key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text("Flutter CRUD"),
          )      ),

      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
              height: 50,
              child: const Card(
                  child: Text(
                "Kamrul Hasan",
              ))),
          Container(
              height: 50,
              child: const Card(
                child: Text(
                  "Rohmat Uddin",
                ),
              )),
          Container(
              height: 50,
              child: const Card(
                child: Text("Rahim Joy"),
              )),
          Container(
              height: 50,
              child: const Card(
                  child: Text(
                "Nazrul Hasan",
              ))),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddDataPage()));
        },
      ),

    );
  }
}
