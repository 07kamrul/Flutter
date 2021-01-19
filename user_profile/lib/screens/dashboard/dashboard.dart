import 'package:flutter/material.dart';
import 'package:user_profile/screens/card_details/card_details.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey _menuKey = new GlobalKey();

  // DateTime now = DateTime.now();
  String _timeString;
  String _dateString;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getDate());

  }

  void _getTime() {
    final String formattedTime =
        DateFormat('kk:mm:ss').format(DateTime.now()).toString();

    setState(() {
      _timeString = formattedTime;
      print(_timeString);
    });
  }

  void _getDate() {
    final String formattedDate =
    DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();

    setState(() {
      _dateString = formattedDate;
    });
  }

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
            // "Date: " +
            //     now.day.toString() +
            //     "-" +
            //     now.month.toString() +
            //     "-" +
            //     now.year.toString() +
            //     "  |  Time: " +
            //     now.hour.toString() +
            //     ":" +
            //     now.minute.toString() +
            //     ":" +
            //     now.second.toString(),

            "Date: "+_dateString.toString()+"   |   "+"Time: "+_timeString.toString(),
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
