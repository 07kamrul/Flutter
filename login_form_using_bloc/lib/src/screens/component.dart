import 'package:flutter/material.dart';

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
