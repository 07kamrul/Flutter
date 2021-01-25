import 'package:flutter/material.dart';


class EphemeralStatePage extends StatefulWidget {

  @override
  _EphemeralStatePage createState() => new _EphemeralStatePage();
}

class _EphemeralStatePage extends State<EphemeralStatePage> {

  String _name = "Kamrul";

  void _performAppStatePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EphemeralStatePage()));
  }


  @override
  Widget build(BuildContext context) {

    return  RaisedButton(
      child: Text(_name),
      onPressed: () {
        setState(() {
          _name = _name == "Kamrul" ? "John" : "Kamrul";
        });
      },
    );
  }
}
