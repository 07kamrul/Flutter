import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey _menuKey = new GlobalKey();

  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();
  final distictController = TextEditingController();

  void _submit() {
    final form = _formKey.currentState.validate();
    if (!form) {
      return;
    }
    _formKey.currentState.save();
    // _performSignInPage();
  }

  //
  // void _performSignInPage() {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => SignInPage()));
  // }

  @override
  void dispose() {
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    genderController.dispose();
    distictController.dispose();

    super.dispose();
  }

  String dropdownvalue = 'Dhaka';
  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Image Upload
    final chooseImage = new Container(
      child: new Wrap(
        children: <Widget>[
          new ListTile(
              leading: new Icon(Icons.photo_library),
              title: new Text("Photo library"),
              onTap: () {
                _imgFromGallery();
                Navigator.of(context).pop();
              }),
          new ListTile(
            leading: new Icon(Icons.photo_camera),
            title: new Text('Camera'),
            onTap: () {
              _imgFromCamera();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );

    //Popup Menu Button
    final menuBtn = new PopupMenuButton(
        key: _menuKey,
        itemBuilder: (_) => <PopupMenuItem<String>>[
              new PopupMenuItem<String>(
                  child: const Text('Rate App'), value: 'Rate App'),
              new PopupMenuItem<String>(
                  child: const Text('Contact'), value: 'Contact'),
              new PopupMenuItem<String>(
                  child: const Text('Logout'), value: 'Logout'),
            ],
        onSelected: (_) {});

    final img = Container(
      child: new CircleAvatar(
        // backgroundImage: new AssetImage('assets/images/dp.png'),
        // backgroundImage: new Image.asset('assets/images/dp.png'),
        backgroundColor: Colors.transparent,
        radius: 50.0,
        child: Image.asset('assets/images/dp.png'),
      ),
    );

    final imageBtn = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50.0,
          child: Image.asset('assets/images/dp.png'),
        ),
        InkWell(
          child: IconButton(
              icon: Icon(Icons.edit),
              tooltip: 'Upload you image',
              onPressed: null),
          onTap: () async {
            // print("Click Event");
            return showDialog(
                context: context, child: new AlertDialog(content: chooseImage));
          },
        )
      ],
    );

    final fullName = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Enter your full name...',
        labelText: 'Full Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: new OutlineInputBorder(
        //   borderRadius: const BorderRadius.all(
        //     const Radius.circular(20.0),
        //   ),
        // )
      ),
    );

    final userName = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Enter your username...',
        labelText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: new OutlineInputBorder(
        //   borderRadius: const BorderRadius.all(
        //     const Radius.circular(20.0),
        //   ),
        // )
      ),
    );

    final mobileNo = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        icon: Icon(Icons.phone),
        hintText: 'Enter your mobile no...',
        labelText: 'Mobile',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: new OutlineInputBorder(
        //   borderRadius: const BorderRadius.all(
        //     const Radius.circular(20.0),
        //   ),
        // )
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        icon: Icon(Icons.mail),
        hintText: 'Enter your email...',
        labelText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: new OutlineInputBorder(
        //   borderRadius: const BorderRadius.all(
        //     const Radius.circular(20.0),
        //   ),
        // )
      ),
    );

    final password = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Enter your password...',
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: new OutlineInputBorder(
        //   borderRadius: const BorderRadius.all(
        //     const Radius.circular(20.0),
        //   ),
        // )
      ),
    );

    final district = Row(
      children: [
        Icon(
          Icons.location_on,
          color: Colors.grey,
          size: 30.0,
        ),
        SizedBox(
          width: 25,
        ),
        new Text(
          'Select District:',
          style: new TextStyle(fontSize: 15.0),
        ),
        SizedBox(
          width: 20,
        ),
        new DropdownButton(
            value: dropdownvalue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepOrange),
            items: <String>['Dhaka', 'Chottogram', 'Gazipur']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                dropdownvalue = newValue;
              });
            })
      ],
    );

    final signUpBtn = Hero(
      tag: "Hero",
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: () {
            // Navigator.of(context).pushNamed(routeName)
          },
          padding: EdgeInsets.all(12),
          color: Colors.lightBlueAccent,
          child: Text(
            'SIgn Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    Container(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.lightBlue, size: 25.0),
        onPressed: () {
          //
        },
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        actions: <Widget>[menuBtn],
        backgroundColor: Colors.pink,
      ),
      key: _scaffoldKey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new Form(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 40.0, right: 40.0),
            children: <Widget>[
              SizedBox(height: 10.0),
              imageBtn,
              SizedBox(height: 10.0),
              fullName,
              SizedBox(height: 12.0),
              userName,
              SizedBox(height: 12.0),
              mobileNo,
              SizedBox(height: 12.0),
              email,
              SizedBox(height: 12.0),
              password,
              SizedBox(height: 12.0),
              district,
              SizedBox(height: 24.0),
              signUpBtn,
            ],
          ),
        ),
      ),
    );
  }
}
