import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
  final String cardTitle;
  final String cardDetails;

  const CardDetails({Key key, this.cardTitle, this.cardDetails})
      : super(key: key);

  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cardTitle),
        backgroundColor: Colors.pink,


      ),
      body: Center(child: Text("${widget.cardDetails}")),
    );
  }
}
