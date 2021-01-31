import 'package:flutter/material.dart';
import '../bloc/provider.dart';
import '../bloc/bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _message = "";

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListView(children: <Widget>[
        nameField(bloc),
        titleField(bloc),
        emailField(bloc),
        secretField(bloc),
        Container(
          padding: EdgeInsets.only(bottom: 25.0),
        ),
        submitButton(bloc),
        Container(
          padding: EdgeInsets.only(bottom: 25.0),
        ),
        Center(
          child: Text(_message),
        )
      ]),
    );
  }

  Widget nameField(bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeName,
          decoration: InputDecoration(
            hintText: "Kamrul Hasan",
            labelText: 'Full Name',
            errorText: snapshot.error,
            icon: Icon(Icons.verified_user),
          ),
        );
      },
    );
  }

  Widget titleField(bloc) {
    return StreamBuilder(
      stream: bloc.titleStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeTitle,
          decoration: InputDecoration(
            hintText: "Software Engineer",
            labelText: 'Title',
            errorText: snapshot.error,
            icon: Icon(Icons.flash_on),
          ),
        );
      },
    );
  }

  Widget emailField(bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "example@gmail.com",
            labelText: 'Email',
            errorText: snapshot.error,
            icon: Icon(Icons.email),
          ),
        );
      },
    );
  }

  Widget secretField(bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: "BatCave",
            labelText: 'Password',
            errorText: snapshot.error,
            icon: Icon(Icons.security),
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Submit'),
          color: Colors.blue,
          onPressed: !snapshot.hasData
              ? null
              : () {
                  setState(() {
                    _message = bloc.submit();
                  });
                },
        );
      },
    );
  }
}
