import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:signin_signup_cts/data/database-helper.dart';
import 'package:signin_signup_cts/models/user.dart';
import 'package:signin_signup_cts/screen/home/update_page.dart';

class HomePage extends StatefulWidget {
  String name;
  String userName;

  HomePage(String name, String userName) {
    this.name = name;
    this.userName = userName;
  }

  @override
  _HomePageState createState() => _HomePageState(name, userName);
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  User user = User();

  String name;
  String userName;

  _HomePageState(String name, String userName) {
    this.name = name;
    this.userName = userName;
  }

  void _updatePage() {
    Navigator.of(context).pushNamed('/update');
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => UpdatePage(user.name)));
  }

  void _registerPage() {
    Navigator.of(context).pushNamed('/register');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Information'),
      ),

      body: ListView(
        children: <Widget>[
          Container(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      child: Image.asset(
                        'assets/images/profile_picture.png',
                        height: 150,
                        width: 150,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 500,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Row(
                        children: <Widget>[
                          Text('Name: ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(name,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                    ),
                    new Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: <Widget>[
                          Text('Username: ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(userName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // body: Center(
      //     child: Container(
      //   height: 800,
      //   width: 400,
      //   child: Card(
      //     child: Column(
      //       // mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         new Container(
      //           alignment: Alignment.center,
      //           padding: EdgeInsets.only(left: 80, right: 80),
      //           child: Row(
      //             children: <Widget>[
      //               // Image.network('https://picsum.photos/250?image=9'),
      //               new Image(image: AssetImage('assets/images/profile_picture.png'),
      //                   width: 300,
      //                   height: 150,
      //                   fit:BoxFit.fill
      //               )
      //
      //               // Image.network(
      //               //     'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pikpng.com%2Fpngvi%2FbJoTbo_my-profile-icon-blank-profile-picture-circle-clipart%2F&psig=AOvVaw0wWBOfz0U4vj-28u237JyF&ust=1610362587526000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIi1j72ake4CFQAAAAAdAAAAABAK'),
      //               // FadeInImage.assetNetwork(
      //               //     placeholder: 'assets/profile_picture.png', image: "URL"),
      //             ],
      //           ),
      //         ),
      //         new Container(
      //           alignment: Alignment.center,
      //           padding: EdgeInsets.only(left: 20.0, top: 20.0),
      //           child: Row(
      //             children: <Widget>[
      //               Text('Name: ',
      //                   textAlign: TextAlign.left,
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, fontSize: 20)),
      //               Text(name,
      //                   textAlign: TextAlign.left,
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, fontSize: 20)),
      //             ],
      //           ),
      //         ),
      //         new Container(
      //           alignment: Alignment.center,
      //           padding: EdgeInsets.only(left: 20.0),
      //           child: Row(
      //             children: <Widget>[
      //               Text('Username: ',
      //                   textAlign: TextAlign.left,
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, fontSize: 20)),
      //               Text(userName,
      //                   textAlign: TextAlign.left,
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, fontSize: 20)),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //     // alignment: Alignment.topCenter,
      //     // child: Column(
      //   ),
      // )),

      floatingActionButton: FloatingActionButton(
        elevation: 8.0,
        child: Icon(Icons.add_to_photos_sharp),
        onPressed: _updatePage,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(name),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage:
                    AssetImage('assets/images/profile_picture.png'),
                radius: 50,
              ),
            ),
            ListTile(
              title: new Text('Profile'),
              leading: new Icon(Icons.account_box),
            ),
            ListTile(
              title: new Text('Register'),
              leading: new Icon(Icons.inbox),
              onTap: _registerPage,
            ),
            ListTile(
              title: new Text('Social'),
              leading: new Icon(Icons.people),
            ),
            ListTile(
              title: new Text('Promotions'),
              leading: new Icon(Icons.local_offer),
            )
          ],
        ),
      ),
      // ),
    );
  }
}
