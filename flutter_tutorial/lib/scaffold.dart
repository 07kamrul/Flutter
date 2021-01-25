import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ephemeral_state.dart';

class ScaffoldPage extends StatefulWidget {
  ScaffoldPage({Key key}) : super(key: key);

  @override
  _ScaffoldPageState createState() => new _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  int _count = 0;


  void _performEphemeralStatePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EphemeralStatePage()));
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Scaffold Example'),
      ),
      body: Center(
        child: Text("We have pressed the button $_count times"),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _count++;
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("User"),
              accountEmail: Text("User Mail"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text('abc'),
              ),
            ),
            ListTile(
              title: new Text("Ephemeral State"),
              leading: new Icon(Icons.mail),
              onTap: _performEphemeralStatePage,
            ),
            ListTile(
              title: new Text("Primary"),
              leading: new Icon(Icons.inbox),
            ),
            ListTile(
              title: new Text("Social"),
              leading: new Icon(Icons.people),
            ),
            ListTile(
              title: new Text("Promotions"),
              leading: new Icon(Icons.local_offer),
            ),
          ],
        ),
      ),
    );
  }
}
