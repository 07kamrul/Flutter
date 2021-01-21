import 'package:flutter/material.dart';
import 'package:user_profile/screens/card_details/card_details.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:user_profile/screens/dashboard/components/drawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey _menuKey = new GlobalKey();

  // DateTime now = DateTime.now();
  String _timeString;
  String _dateString;

  String descriptions =
      "Flutter is an open-source UI software development kit created by Google. "
      "It is used to develop applications for Android, iOS, Linux, Mac, Windows, "
      "Google Fuchsia,[4] and the web from a single codebase. The first version of"
      " Flutter was known as codename and ran on the Android operating system. "
      "It was unveiled at the 2015 Dart developer summit,[6] with the stated intent"
      " of being able to render consistently at 120 frames per second.[7] During the"
      " keynote of Google Developer Days in Shanghai, Google announced Flutter Release "
      "Preview 2, which is the last big release before Flutter 1.0. On December 4, 2018, "
      "Flutter 1.0 was released at the Flutter Live event, denoting the first  version of "
      "the Framework. On December 11, 2019, Flutter 1.12 was released at the Flutter Interactive "
      "event. On May 6, 2020, the Dart SDK in version 2.8 and the Flutter in version 1.17.0 were"
      " released, where support was added to the Metal API, improving performance on iOS devices "
      "(approximately 50%), new Material widgets, and new network tracking. Dart platform Flutter "
      "apps are written in the Dart language and make use of many of the language's more advanced "
      "features.[9]  On Windows, macOS, and Linux[10] Flutter runs in the Dart virtual machine, which"
      " features a just-in-time execution engine. While writing and debugging an app, Flutter uses Just"
      " In Time compilation, allowing for hot reload, with which modifications to source files can be i"
      "njected into a running application. Flutter extends this with support for stateful hot reload, where "
      "in most cases changes to source code are reflected immediately in the running app without requiring "
      "a restart or any loss of state.[11] Release versions of Flutter apps are compiled with ahead-of-time "
      "(AOT) compilation on both Android and iOS,[12] making Flutter's high performance on mobile devices possible."
      "Flutter engine Flutter's engine, written primarily in C++, provides low-level rendering support using Google's "
      "Skia graphics library. Additionally, it interfaces with platform-specific SDKs such as those provided by "
      "Android and iOS.[9] The Flutter Engine is a portable runtime for hosting Flutter applications. It implements "
      "Flutter's core libraries, including animation and graphics, file and network I/O, accessibility support, plugin "
      "architecture, and a Dart runtime and compile toolchain. Most developers interact with Flutter via the Flutter "
      "Framework, which provides a reactive framework and a set of platform, layout, and foundation widgets.";

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getDate());
  }

  void _getTime() {
    final String formattedTime =
        DateFormat('kk:mm:ss').format(DateTime.now()).toString();

    setState(() {
      _timeString = formattedTime;
      // print(_timeString);
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
                          cardDetails: descriptions,
                          cardIcon: icon,
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

            "Date: " +
                _dateString.toString() +
                "   |   " +
                "Time: " +
                _timeString.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),

      // //Drawer
      // drawer: leftImagedrawer,
      drawer: rightImageDrawer,
    );
  }
}
