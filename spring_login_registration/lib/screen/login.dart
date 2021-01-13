import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spring_login_registration/model/user.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(233, 65, 82, 1),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(1, 5))
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text("Login",
                          style: GoogleFonts.pacifico(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Email",
                          style: GoogleFonts.roboto(
                            fontSize: 40,
                            color: Color.fromRGBO(255, 255, 255, 0.8),
                          ),
                        ),
                      ),
                      TextFormField(
                        // controller: TextEditingController(text: user.email),
                        // onChanged: (value){
                        //   user.email = value;
                        // },
                        style: TextStyle(fontSize: 30, color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      Container(
                        height: 10,
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Password",
                          style: GoogleFonts.roboto(
                            fontSize: 40,
                            color: Color.fromRGBO(255, 255, 255, 0.8),
                          ),
                        ),
                      ),
                      TextFormField(
                        // controller: TextEditingController(text: user.email),
                        // onChanged: (value){
                        //   user.email = value;
                        // },
                        style: TextStyle(fontSize: 30, color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      Container(
                        height: 10,
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          "Dont have Account?",
                          style: GoogleFonts.roboto(
                              fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 70,
                child: FlatButton(
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: Icon(Icons.arrow_forward,
                    color: Colors.green,
                    size: 20,),
                ),
              ),
            ],
          )),
    ));
  }
}
