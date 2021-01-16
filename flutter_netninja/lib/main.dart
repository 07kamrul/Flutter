import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home:Home()
));



class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My First App"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        // child: Text("Hello Ninja",
        //   style: TextStyle(
        //       fontSize: 20.0,
        //       fontWeight: FontWeight.bold,
        //       letterSpacing: 2.0,
        //       color: Colors.grey[600]
        //   ),
        // ),

        // child: Image(image: AssetImage('assets/images/d3.jpeg'),),

        // child: Icon(
        //   Icons.airport_shuttle,
        //   color: Colors.lightBlue,
        //   size: 100.0
        // ),

        // child: FlatButton(
        //   onPressed: (){},
        //   child: Text("Click me"),
        //   color: Colors.lightBlue,
        // ),

        child: RaisedButton.icon(
            onPressed: (){},
            icon: Icon(
              Icons.mail
            ),
            label: Text("Mail Box"),
          color: Colors.amber,
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text("Click"),
        backgroundColor: Colors.red,
      ),
    );
  }
}