import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_data.dart';
import 'hello.dart';

class Home extends StatefulWidget {
  // Home({Key: key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text('Flutter CRUD', style: TextStyle(color: Colors.white)))
          ],
        ),
        backgroundColor: Colors.pink,
      ),

      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
              height: 50,
              child: Card(
                // child: Text("Kamrul Hasan"),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 10,
                            child: Container(
                              height: 400,
                              width: 360,
                              child: ListView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(20.0),
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 80,
                                      backgroundImage: NetworkImage(
                                        'https://placeimg.com/640/480/any',
                                      )),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  new Center(
                                      child: new Text(
                                    'Md Kamrul Hasan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    width: 300,
                    height: 100,
                    child: Text('Kamrul Hasan'),
                  ),
                ),
              )),
          Container(
              height: 50,
              child: Card(
                // child: Text("Rohmat Uddin"),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 10,
                            child: Container(
                              height: 400,
                              width: 360,
                              child: ListView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(20.0),
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 80,
                                      backgroundImage: NetworkImage(
                                        'https://placeimg.com/640/480/any',
                                      )),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  new Center(
                                      child: new Text(
                                    'Rohmat Uddin',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    width: 300,
                    height: 100,
                    child: Text('Rohmat Uddin'),
                  ),
                ),
              )),
          Container(
              height: 50,
              child: Card(
                // child: Text("Rahim Joy"),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 10,
                            child: Container(
                              height: 400,
                              width: 360,
                              child: ListView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(20.0),
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 80,
                                      backgroundImage: NetworkImage(
                                        'https://placeimg.com/640/480/any',
                                      )),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  new Center(
                                      child: new Text(
                                    'Arifur Islam',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    width: 300,
                    height: 100,
                    child: Text('Arifur Islam'),
                  ),
                ),
              )),
          Container(
            height: 50,
            child: Card(
              // child: Text("Nazrul Hasan"),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          elevation: 10,
                          child: Container(
                            height: 400,
                            width: 360,
                            child: ListView(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(20.0),
                              children: <Widget>[
                                CircleAvatar(
                                    radius: 80,
                                    backgroundImage: NetworkImage(
                                      'https://placeimg.com/640/480/any',
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                new Center(
                                    child: new Text(
                                  'Shariful Islam',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  width: 300,
                  height: 100,
                  child: Text('Shariful Islam'),
                ),
              ),
            ),
          ),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: (){
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => AddDataPage()));
      //   },
      // ),
      //

      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: Colors.pinkAccent),
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddDataPage()));
          },
        ),
      ),
    );
  }
}
