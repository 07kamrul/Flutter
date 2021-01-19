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
        actions: [
          IconButton(icon: const Icon(Icons.more_vert_rounded), onPressed: (){})
        ],
      ),
      body: Center(child: Text("${widget.cardDetails}")),
    );
  }
}
