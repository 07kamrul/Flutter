import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

class HelloPage extends StatefulWidget {

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {

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
