import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_profile/screens/dashboard.dart';
import 'package:user_profile/screens/sign_up.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();
  bool _isHidden = true;

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  void showPassword(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final logo = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 50.0,
      child: Image.asset('assets/images/logo.png'),
    );

    final username = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          icon: Icon(Icons.mail),
          labelText: 'Username',
          hintText: "Enter your username..",
          contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0)),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter valid username';
        }
      },
    );
    final password = TextFormField(
      autofocus: false,
      obscureText: _isHidden,
      decoration: InputDecoration(
          icon: Icon(Icons.lock),
          labelText: 'Password',
          hintText: "Enter your password...",
          contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
        suffix: InkWell(
          onTap: showPassword,
          child: Icon(
            _isHidden ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        )
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter valid username';
        }
      },
    );

    final loginBtn = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: _submit,
        color: Colors.pink,
      ),
    );

    final signupBtn = FlatButton(
      child: Text(
        'Dont Have Account?',
        style: TextStyle(color: Colors.black, decoration: TextDecoration.none),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.login),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        backgroundColor: Colors.pink,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: new Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              children: <Widget>[
                SizedBox(height: 10.0),
                logo,
                SizedBox(height: 10.0),
                username,
                SizedBox(height: 10.0),
                password,
                SizedBox(height: 10.0),
                loginBtn,
                SizedBox(height: 10.0),
                signupBtn
              ],
            ),
          ),
        ),
      ),
    );
  }
}
