import 'package:flutter/material.dart';

final leftImagedrawer = Drawer(
  child: Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text("Md Kamrul Hasan"),
        accountEmail: Text("mdkamrulhasanewu@gmail.com"),
        decoration: BoxDecoration(
          color: Colors.pink,
        ),
        currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50.0,
            backgroundImage: AssetImage('assets/images/logo.png')),
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text("Home"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.account_circle_rounded),
        title: Text("Profile"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.login),
        title: Text("Login"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("Logout"),
        onTap: () {},
      ),
      Expanded(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
        ),
      ),
    ],
  ),
);

final rightImageDrawer = Drawer(
  child: Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text("Md Kamrul Hasan"),
        accountEmail: Text("mdkamrulhasanewu@gmail.com"),
        decoration: BoxDecoration(
          color: Colors.pink,
        ),
        otherAccountsPictures: <Widget>[
          CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/logo.png')),
        ],
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text("Home"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.account_circle_rounded),
        title: Text("Profile"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.login),
        title: Text("Login"),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("Logout"),
        onTap: () {},
      ),
      Expanded(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
        ),
      ),
    ],
  ),
);

final rightImageRowDrawer = Drawer(
  child: Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Expanded(
          flex: 1,
          child: Container(
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/logo.png')),
                ],
              ),
            ),
          )),
      Expanded(
          flex: 2,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.account_circle_rounded),
                title: Text("Profile"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text("Login"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {},
              ),
            ],
          ))
    ],
  ),
);
