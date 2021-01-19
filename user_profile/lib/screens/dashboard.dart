import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey _menuKey = new GlobalKey();

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1)),
        child: new InkWell(
          onTap: () {},
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.dashboard),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Dashboard",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        elevation: .1,
        backgroundColor: Colors.pink,
        actions: <Widget>[menuBtn],
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
      drawer: drawer,
    );
  }
}
