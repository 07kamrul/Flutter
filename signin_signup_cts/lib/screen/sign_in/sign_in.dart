import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup_cts/models/user.dart';
import 'package:signin_signup_cts/screen/sign_in/sign_in_presenter.dart';

import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}


class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _email, _password;
  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _register() {
    Navigator.of(context).pushNamed('/register');
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_email, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _ctx = context;

    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Login"),
      color: Colors.green,
    );

    var registerBtn = new RaisedButton(
      padding: const EdgeInsets.all(10.0),
      onPressed: _register,
      child: new Text("Register"),
      color: Colors.green,
    );

    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Login",
          textScaleFactor: 2.0,
        ),
        new Form(
          key : formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                  padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (value) => _email = value,
                  decoration: new InputDecoration(labelText: "Email",hintText: "Enter your valid email..."),

                ),
              ),
              new Padding(
                  padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                 obscureText: true,
                  onSaved: (value) => _password = value,
                  decoration: new InputDecoration(labelText: "Password",hintText: "Enter your valid password..."),
                ),
              )
            ],
          ),
        ),
        new Padding(
          padding: const EdgeInsets.all(10.0),
          child: loginBtn
        ),
        registerBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Page"),
      ),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  @override
  void onLoginSuccess(User user) async{
    if(user.username == ""){
      _showSnackBar("Login not successful");
    }else{
      _showSnackBar(user.toString());
    }
    setState(() {
      _isLoading = false;
    });
    if(user.flaglogged == 'logged'){
      print("Logged");
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomePage(user.name,user.username))
      );
    }else{
      print("Not Logged");
    }
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar("Login not successful");
    setState(() {
      _isLoading = false;
    });
  }
}