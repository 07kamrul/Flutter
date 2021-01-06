import 'package:flutter/material.dart';

// import 'package:validate/validate.dart';

void main() => runApp(new MaterialApp(
  title: 'Forms in Flutter',
  home: new LoginPage(),
));

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginData {
  String name = ' ';
  String email = ' ';
}

class _LoginPageState extends State<LoginPage> {
  // final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController myController = TextEditingController();

  List<String> messages = List();

  List<String> name = List();
  List<String> email = List();

  _LoginData _data = new _LoginData();

  // String _validataEmail(String value){
  //
  //   if (!Validate.isEmail(value)) {
  //     return 'The E-mail Address must be a valid email address.';
  //   }
  //
  //   return null;
  // }

  String _validateName(String value) {
    if (!value.contains(" ")) {
      return "Type your valid name";
    }
    return null;
  }

  String _validateEmail(String value) {
    if (!value.contains(" ")) {
      return "Type your valid email";
    }
    return null;
  }

  // void submit() {
  //   if (this._formKey.currentState.validate()) {
  //     _formKey.currentState.save();
  //
  //     print('Printing the form data');
  //     print('Name:${_data.name}');
  //     print('Email:${_data.email}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;

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
        // keyboardType: TextInputType.emailAddress,

        hintText: 'Enter Yours Email Address...',
        labelText: 'E-mail Address',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );

    // return new Scaffold(
    //   appBar: new AppBar(
    //     title: new Text('Form'),
    //   ),
    //   body: new Container(
    //     padding: new EdgeInsets.all(20.0),
    //     child: new Form(
    //       key: this._formKey,
    //       child: new ListView(
    //         children: <Widget>[
    //           new TextFormField(
    //             keyboardType: TextInputType.text,
    //             decoration: new InputDecoration(
    //               hintText: 'Enter Yours Name...',
    //               labelText: 'Name',
    //             ),
    //             validator: this._validateName,
    //             onSaved: (String value) {
    //               this._data.name = value;
    //             },
    //           ),
    //           new TextFormField(
    //             keyboardType: TextInputType.emailAddress,
    //             decoration: new InputDecoration(
    //               hintText: 'you@example.com',
    //               labelText: 'E-mail Address',
    //             ),
    //             validator: this._validateEmail,
    //             onSaved: (String value) {
    //               this._data.email = value;
    //             },
    //           ),
    //           new Container(
    //             width: screenSize.width,
    //             child: new RaisedButton(
    //               child: new Text(
    //                 'Show Input Values',
    //                 style: new TextStyle(color: Colors.white),
    //               ),
    //               onPressed: () => this.submit(),
    //               // onPressed: () {
    //               //   Navigator.pop(context, 'Yep!');
    //               //   },
    //               color: Colors.blue,
    //             ),
    //             margin: new EdgeInsets.only(top: 20.0),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
        appBar: new AppBar(
          title: new Text('Form'),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(left: 20.0, right: 20, bottom: 100),
              //
              //
              // padding: new EdgeInsets.all(20.0),

              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(messages[index]),
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
                        messages.add(myController.text);
                        myController.clear();
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
