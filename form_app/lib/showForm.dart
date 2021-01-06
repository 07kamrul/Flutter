import 'package:flutter/material.dart';


class DisplayApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Form',
      home: DisplayValue(),
    );
  }
}

class DisplayValue extends StatefulWidget{

  @override
  _DisplayValueState createState() => _DisplayValueState();

}

class _DisplayValueState extends State<DisplayValue>{
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose(){
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text("Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          controller: nameController,
        ),
        //
        // child: new Form(
        //   child: new ListView(
        //     children: [],
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          return showDialog(
              context: context,
            builder: (context){
                return AlertDialog(content:Text(nameController.text),
                );
            },
          );
        },
        tooltip:'Show the value',
        // child: Icon(Icon.text_fields),
      ),
    );
  }

}