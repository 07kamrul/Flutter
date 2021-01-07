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

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
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
          key: _formKey,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  hintText: 'Enter your name...',
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter your valid name';
                  }
                  return null;
                },
              ),
              new TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  hintText: 'Enter your email...',
                  labelText: 'Email',
                ),
                validator: (emailController) {
                  if (emailController.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(emailController)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new Text(
                    'Show Input Values',
                    style: new TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()){
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(nameController.text),
                                Text(emailController.text)
                              ],
                            ),
                          );
                        },
                      );
                    })
                     
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
