import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
  final String cardTitle;
  final String cardDetails;
  final IconData cardIcon;

  const CardDetails({Key key, this.cardTitle, this.cardDetails, this.cardIcon})
      : super(key: key);

  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    final img = Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.asset(
        'assets/images/cardImage.jpg',
        fit: BoxFit.fill,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );

    final title = Container();

    final discrip = SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Text(widget.cardDetails),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cardTitle),
        backgroundColor: Colors.pink,
      ),
      // body: Center(child: Text("${widget.cardDetails}")),

      body: Container(
        child: Column(
          children: <Widget>[
            // new Container(
            //   alignment: Alignment.topCenter,
            //   child: img,
            // ),

            new Container(
              alignment: Alignment.topCenter,
              child: Icon(
                widget.cardIcon,
                color: Colors.grey,
                size: 100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new Container(
              child: Text(widget.cardTitle),
            ),
            SizedBox(
              height: 20,
            ),
            new Expanded(
              child: discrip,
            )
          ],
        ),
      ),
    );
  }
}
