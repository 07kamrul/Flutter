import 'package:flutter/material.dart';
import 'package:flutter_crud_api/screen/addscreen.dart';
import 'package:flutter_crud_api/screen/home.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(MyApp());
}

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();



}
class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.orangeAccent,
      ),

      home: Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          title: Text(
            "Flutter CRUD API",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: HomePage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            var result = await Navigator.push(
              _scaffoldState.currentContext,
              MaterialPageRoute(builder: (BuildContext context){
                return AddScreen();
              }),
            );
            if(result != null){
              setState(() {});
            }
            Fluttertoast.showToast(
              msg: "This is Center Short Toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
