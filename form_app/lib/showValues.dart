import 'package:flutter/material.dart';


class LoginPageShow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginData {
  String name = ' ';
  String email = ' ';
}

class _LoginPageState extends State<LoginPageShow> {
  // final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController myController = TextEditingController();

  List<String> messages = List();

  List<String> name = List();
  List<String> email = List();



  @override
  Widget build(BuildContext context) {

    final nameField = TextFormField(
      controller: myController,
      style: TextStyle(
        decorationColor: Colors.white,
        color: Colors.redAccent,
      ),
      autofocus: false,
      onSaved: (String value){},
      decoration: new InputDecoration(
        hintText: 'Enter Yours Name...',
        labelText: 'Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );


    final emailField = TextFormField(
      controller: myController,
      style: TextStyle(
        decorationColor: Colors.white,
        color: Colors.redAccent,
      ),
      autofocus: false,
      onSaved: (String value){},
      decoration: InputDecoration(
        hintText: 'Enter Yours Email Address...',
        labelText: 'E-mail Address',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );


    return Scaffold(
        appBar: new AppBar(
          title: new Text('Form'),
        ),
        backgroundColor: Colors.white,
        body: Stack(

          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(left: 0, top: 0),

              child: ListView.builder(
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(name[index]),
                  );
                },
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(right: 0, top: 0),

              child: ListView.builder(
                itemCount: email.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(email[index]),
                  );
                },
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  nameField,
                  emailField,
                  MaterialButton(
                    child: Text("send message"),
                    onPressed: () {
                      setState(() {
                        name.add(myController.text);
                        email.add(myController.text);
                        myController.clear();
                      });
                    },
                    color: Colors.blue,

                  )
                ],
              ),
            )
          ],
        ));
  }
}
