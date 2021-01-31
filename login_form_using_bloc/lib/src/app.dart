import 'package:flutter/material.dart';
import 'package:login_form_using_bloc/src/screens/loginScreen.dart';

import 'bloc/provider.dart';


class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: "Login Form using Bloc",
        home: Scaffold(
          appBar: AppBar(
            title: Text('Bloc login form'),
          ),
          body: LoginScreen(),
        ),
      ),
    );
  }
}