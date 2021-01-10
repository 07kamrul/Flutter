import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:signin_signup_cts/data/database-helper.dart';
import 'package:signin_signup_cts/models/user.dart';

class HomePage extends StatefulWidget {
  String name;
  String userName;

  HomePage(String name, String userName) {
    this.name = name;
    this.userName = userName;
  }

  @override
  _HomePageState createState() => _HomePageState(name, userName);
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  User user = User();

  String name;
  String userName;

  _HomePageState(String name, String userName) {
    this.name = name;
    this.userName = userName;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Information'),
      ),
      body: Center(
        child:Container(

          height: 800,
          width: 400,

          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network('https://picsum.photos/250?image=9'),
                Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(name,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,

                              )),
                          Text(userName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ))
              ],
            ),
            // alignment: Alignment.topCenter,
            // child: Column(
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8.0,
        child: Icon(Icons.add_to_photos_sharp),
        onPressed: (){
          print("Update your information");
        },
      ),
      // ),
    );
  }
}
