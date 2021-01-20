import 'package:flutter/material.dart';
import 'package:user_profile/screens/dashboard/dashboard.dart';
import 'package:user_profile/screens/signin_signup/sign_in.dart';
import 'package:user_profile/screens/signin_signup/sign_up.dart';

void main() =>  runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "User Profile",
      theme: ThemeData(

        scaffoldBackgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      home: LoginPage(),
    );
  }
}