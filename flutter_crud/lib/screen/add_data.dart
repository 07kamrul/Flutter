import 'package:flutter/material.dart';
import 'package:flutter_crud/screen/home.dart';

class AddDataPage extends StatefulWidget {
  // Home({Key: key}) : super(key: key);
  @override
  _AddDataPage createState() => new _AddDataPage();
}

class _AddDataPage extends State<AddDataPage> {
  final _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _submit() {
    final form = _formKey.currentState.validate();
    if (!form) {
      return;
    }
    _formKey.currentState.save();
    _performHomePage();
  }

  void _performHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var saveBtn = new RaisedButton(
      onPressed: _submit,
      child:
          new Text("Login", style: new TextStyle(fontWeight: FontWeight.bold)),
      color: Colors.pink,
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
                  style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Colors.pink,
                  ),
                ),
              )),
          const Divider(
            color: Colors.pinkAccent,
            height: 20,
            thickness: 3,
            endIndent: 0,
          ),
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new TextFormField(
              decoration: new InputDecoration(
                  labelText: "First Name",
                  hintText: "Enter your first name..."),
              controller: firstNameController,
              keyboardType: TextInputType.text,
              validator: (firstNameController) {
                if (firstNameController.isEmpty) {
                  return 'Please enter your first name.';
                }
                return null;
              },
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new TextFormField(
              decoration: new InputDecoration(
                  labelText: "Last Name", hintText: "Enter your last name..."),
              controller: lastNameController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your first name.';
                }
                return null;
              },
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new TextFormField(
              decoration: new InputDecoration(
                  labelText: "Email", hintText: "Enter your email..."),
              controller: emailController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your first name.';
                }
                return null;
              },
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new TextFormField(
              obscureText: true,
              decoration: new InputDecoration(
                  labelText: "Password", hintText: "Enter your password..."),
              controller: passwordController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your first name.';
                }
                return null;
              },
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.addchart,
              color: Colors.white,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Add Data', style: TextStyle(color: Colors.white)))
          ],
        ),
        backgroundColor: Colors.pink,
      ),
      key: _scaffoldKey,
      body: new Container(
        child: new Center(
          child: addForm,
        ),
      ),
    );
  }
}
