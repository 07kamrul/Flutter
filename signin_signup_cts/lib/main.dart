import 'package:flutter/material.dart';
import 'package:signin_signup_cts/screen/home/home_page.dart';
import 'package:signin_signup_cts/screen/home/update_page.dart';
import 'package:signin_signup_cts/screen/sign_in/sign_in.dart';
import 'package:signin_signup_cts/screen/sign_up/sign_up.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login App',
        home: new HomePage('', ''),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new LoginPage(),
          '/home': (BuildContext context) => new HomePage('', ''),
          '/register': (BuildContext context) => new RegisterPage(),
          '/update': (BuildContext context) => new UpdatePage(),
          //'/': (BuildContext context) => new LoginPage(),
        });
  }
}
