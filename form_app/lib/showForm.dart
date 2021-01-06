import 'package:flutter/material.dart';

class DisplayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form',
      home: DisplayValue(),
    );
  }
}

class DisplayValue extends StatefulWidget {
  @override
  _DisplayValueState createState() => _DisplayValueState();
}

class _DisplayValueState extends State<DisplayValue> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Padding(

        padding: const EdgeInsets.all(20.0),
        // child: TextField(
        //   controller: nameController,
        // ),
        //
        child: new Form(
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  hintText: 'Enter your name...',
                  labelText: 'Name',
                ),
              ),
              new TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  hintText: 'Enter your email...',
                  labelText: 'Email',
                ),
              ),
              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                    child: new Text(
                    'Show Input Values',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed:(){
                      return showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              content:Container(
                                height: 100,
                                child: Column(
                                children: [
                                  Text(nameController.text),
                                  Text(emailController.text)
                                ],
                                ),
                              ),
                            );
                          },
                      );
                    },
                  color: Colors.blue,

                ),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     return showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           content: Text(nameController.text),
      //         );
      //       },
      //     );
      //   },
      //   tooltip: 'Show the value',
      //   // child: Icon(Icon.text_fields),
      // ),
    );
  }
}
