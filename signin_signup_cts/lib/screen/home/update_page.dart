import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:signin_signup_cts/data/database-helper.dart';
import 'package:signin_signup_cts/models/user.dart';

class UpdatePage extends StatefulWidget {
  String name;

  UpdatePage() {}

  // UpdatePage(String name, String userName) {
  //   this.name = name;
  //   this.userName = userName;
  // }

  @override
  _UpdatePageState createState() => _UpdatePageState(name);
}

class _UpdatePageState extends State<UpdatePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  User user = User();

  String name;

  _UpdatePageState(String name) {
    this.name = name;
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
        title: Text('Update Information'),
      ),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
