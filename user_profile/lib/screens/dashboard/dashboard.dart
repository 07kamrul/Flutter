import 'package:flutter/material.dart';
import 'package:user_profile/screens/card_details/card_details.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey _menuKey = new GlobalKey();

  static final DateTime now = DateTime.now();

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1)),
        child: new InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardDetails(
                          cardTitle: title,
                          cardDetails: "Hello $title",
                        )));
            //
            // return showDialog(
            //     context: context,
            //     builder: (context) => AlertDialog(
            //           title: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Container(
            //                 decoration: BoxDecoration(
            //                   color: Colors.greenAccent,
            //                   borderRadius: BorderRadius.only(
            //                       bottomRight: Radius.circular(6)),
            //                 ),
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Text(
            //                   title,
            //                   style: TextStyle(color: Colors.black),
            //                 ),
            //               )
            //             ],
            //           ),
            //           content: SingleChildScrollView(
            //             child: ListBody(
            //               children: <Widget>[
            //                 Center(
            //                     child: Icon(icon,
            //                         size: 50.0, color: Colors.black)),
            //                 SizedBox(
            //                   height: 40,
            //                 ),
            //                 Text('I liked using TermsFeed very much. '
            //                     'I thought the website was easy to navigate and the instructions for generating the terms was clear.'
            //                     'I even recommended you on a Facebook Group I am a member of.'),
            //                 SizedBox(
            //                   height: 20,
            //                 ),
            //               ],
            //             ),
            //           ),
            //           actions: <Widget>[
            //             TextButton(
            //               child: Text('close'),
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //             ),
            //           ],
            //         ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Center(child: Icon(icon, size: 40.0, color: Colors.black)),
              SizedBox(
                height: 20.0,
              ),
              new Center(
                child: new Text(
                  title,
                  style: new TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final menuBtn = new PopupMenuButton(
        key: _menuKey,
        itemBuilder: (_) => <PopupMenuItem<String>>[
              new PopupMenuItem<String>(
                  child: const Text('Rate App'), value: 'Rate App'),
              new PopupMenuItem<String>(
                  child: const Text('Contact'), value: 'Contact'),
              new PopupMenuItem<String>(
                  child: const Text('Logout'), value: 'Logout'),
            ],
        onSelected: (_) {});

    final drawer = Drawer(
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
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text("Profile"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text("Login"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dashboard")),
        actions: [menuBtn],
        elevation: .1,
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 1.0),
        child: GridView.count(
          crossAxisCount: 3,
          // padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem('Home', Icons.home),
            makeDashboardItem('Contact', Icons.contacts),
            makeDashboardItem('Map', Icons.map),
            makeDashboardItem('Phone', Icons.phone),
            makeDashboardItem('Camera', Icons.camera_alt),
            makeDashboardItem('Setting', Icons.settings),
            makeDashboardItem('Album', Icons.photo_album),
            makeDashboardItem('WiFi', Icons.wifi),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.pink,
        height: 50,
        child: Center(
          child: Text(
            "Date: " +
                now.day.toString() +
                "-" +
                now.month.toString() +
                "-" +
                now.year.toString() +
                "  |  Time: " +
                now.hour.toString() +
                ":" +
                now.minute.toString() +
                ":" +
                now.second.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),

      // //Drawer
      drawer: drawer,
    );
  }
}
