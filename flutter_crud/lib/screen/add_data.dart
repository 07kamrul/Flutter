import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDataPage extends StatefulWidget {
  // Home({Key: key}) : super(key: key);
  @override
  _AddDataPage createState() => _AddDataPage();
}

class _AddDataPage extends State<AddDataPage> {
  get _formKey => new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      setState(() {
        form.save();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var saveBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Login"),
      color: Colors.greenAccent,
    );

    var addForm = new Form(
      key: _formKey,
      child: new ListView(
        children: <Widget>[
          new Padding(

              padding: const EdgeInsets.all(5.0),
              child: new Center(

                child: new Text(
                  "Add Data",
                  textScaleFactor: 2.0,

                ),
              )),
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new TextFormField(
              decoration: new InputDecoration(
                  labelText: "First Name",
                  hintText: "Enter your first name..."),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new TextFormField(
              decoration: new InputDecoration(
                  labelText: "Last Name", hintText: "Enter your last name..."),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new TextFormField(
              decoration: new InputDecoration(
                  labelText: "Email", hintText: "Enter your email..."),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new TextFormField(
              decoration: new InputDecoration(
                  labelText: "Password", hintText: "Enter your password..."),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: saveBtn,
          ),
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
          title: Center(
        child: Text("Add Data"),
      )),
      key: _scaffoldKey,
      body: new Container(
        child: new Center(
          child: addForm,
        ),
      ),
    );
  }
}
