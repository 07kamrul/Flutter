import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:signin_signup_cts/data/database-helper.dart';
import 'package:signin_signup_cts/models/user.dart';

class HomePage extends StatefulWidget {
  String name;
  String userName;
  HomePage(String name, String userName){
    this.name =name;
    this.userName =userName;
  }
  @override
  _HomePageState createState() => _HomePageState(name,userName);

}

class _HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper= DatabaseHelper();
  User user= User();

  String name;
  String userName;

  _HomePageState(String name, String userName){
    this.name =name;
    this.userName =userName;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseHelper.seleteUser(user).then((value){

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),

      ),
      body: Container(
        child:Column(
          children: [
            Text(name??''),
            Text(userName??''),
          ],
        ),
      ),
    );
  }
}


