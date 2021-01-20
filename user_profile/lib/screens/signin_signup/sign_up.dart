import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:user_profile/screens/signin_signup/sign_in.dart';

enum ChooseYourGender { male, female, others }

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // final genderController = TextEditingController();
  // final distictController = TextEditingController();

  void _onRememberMeChanged(bool newValue) => setState(() {
        checkedValue = newValue;

        if (checkedValue) {
        } else {}
      });

  ChooseYourGender _yourGender = ChooseYourGender.male;
  bool checkedValue = false;
  bool _isHidden = true;

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      _performSignInPage();
    }
  }

  void _performSignInPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void showPassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    userNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // genderController.dispose();
    // distictController.dispose();

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

  List genders = ["Male", "Female"];
  String selectGender;

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
            activeColor: Theme.of(context).primaryColor,
            value: genders[btnValue],
            groupValue: selectGender,
            onChanged: (value) {
              setState(() {
                print(value);
                selectGender = value;
              });
            }),
        Text(title)
      ],
    );
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

    final imageBtn = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50.0,
          // child: Image.asset('assets/images/dp.png'),
          child: _image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(_image,
                      width: 100, height: 100, fit: BoxFit.fitHeight),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/dp.png'),

                  // child: Icon(
                  //   Icons.camera_alt,
                  //   color: Colors.grey[800],
                  // ),
                  //
                ),
        ),
        InkWell(
          child: IconButton(
            icon: Icon(Icons.edit),
            tooltip: 'Upload you image',
          ),
          onTap: () async {
            // print("Click Event");
            return showDialog(
                context: context, child: new AlertDialog(content: chooseImage));
          },
        )
      ],
    );

    final fullName = TextFormField(
      controller: fullNameController,
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
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter your valid full name';
        }
        return null;
      },
    );

    final userName = TextFormField(
      controller: userNameController,
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
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter your valid username';
        }
        return null;
      },
    );

    final mobileNo = TextFormField(
      controller: mobileController,
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
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter your valid mobile no';
        }
        return null;
      },
    );

    final email = TextFormField(
      controller: emailController,
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
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter your valid email';
        }
        return null;
      },
    );

    final password = TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      autofocus: false,
      obscureText: _isHidden,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Enter your password...',
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        suffix: InkWell(
          onTap: showPassword,
          child: Icon(
            _isHidden ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
        // border: new OutlineInputBorder(
        //   borderRadius: const BorderRadius.all(
        //     const Radius.circular(20.0),
        //   ),
        // )
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter your valid password';
        }
        return null;
      },
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

    final gender = new Row(
      children: <Widget>[
        Icon(
          Icons.people_alt_outlined,
          color: Colors.grey,
          size: 30.0,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "Gender:",
          style: new TextStyle(fontSize: 15.0),
        ),
        addRadioButton(0, 'Male'),
        addRadioButton(1, 'Female')
      ],
    );

    final dialogDescriptions = AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(6)),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Terms & Conditions",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
                'I think TermsFeed is great. I liked that it was hassle free and easy to set up.'
                ' Again, its a great feature for a fast and cheap set up, '
                'which gives me peace of mind, as I know have a Terms of Use agreement. :-)'),
            SizedBox(
              height: 40,
            ),
            Text('I liked using TermsFeed very much. '
                'I thought the website was easy to navigate and the instructions for generating the terms was clear.'
                'I even recommended you on a Facebook Group I am a member of.'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    final terms = Row(
      children: <Widget>[
        Icon(
          Icons.verified_user,
          color: Colors.grey,
          size: 30.0,
        ),
        // SizedBox(
        //   width: 25,
        // ),
        Checkbox(value: checkedValue, onChanged: _onRememberMeChanged),
        Text(
          "I agree with ",
          style: new TextStyle(fontSize: 15.0),
        ),
        InkWell(
          child: Text(
            "Terms & Conditions",
            style: new TextStyle(fontSize: 15.0),
          ),
          onTap: () async {
            return showDialog(
                context: context, builder: (context) => dialogDescriptions);
          },
        )
      ],
    );

    final haveAccount = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Already have Account?", style: TextStyle(fontSize: 15)),
        SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () {
            _performSignInPage();
          },
          child: Text(
            "Sign in",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );

    final signUpBtn = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: _submit,
        padding: EdgeInsets.all(12),
        color: Colors.pink,
        child: Text(
          'SIgn Up',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: Text("Sign Up")),

        backgroundColor: Colors.pink,
      ),
      key: _scaffoldKey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: new Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
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
                SizedBox(height: 12.0),
                gender,
                SizedBox(height: 12.0),
                terms,
                SizedBox(height: 18.0),
                haveAccount,
                SizedBox(height: 20.0),
                signUpBtn,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
