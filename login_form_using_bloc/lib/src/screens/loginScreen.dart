import 'package:flutter/material.dart';
import '../bloc/provider.dart';
import '../bloc/bloc.dart';
import 'component.dart';

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
