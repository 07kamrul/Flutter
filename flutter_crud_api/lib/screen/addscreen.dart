import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_api/model/profile.dart';
import 'package:flutter_crud_api/service/api_service.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddScreen extends StatefulWidget {
  Profile profile;

  AddScreen({this.profile});

  @override
  _AddScreenState createState() => _AddScreenState();

}

class _AddScreenState extends State<AddScreen> {
  bool _isLoading = false;

  ApiService _apiService = ApiService();

  bool _isFieldNameValid;
  bool _isFieldEmailValid;
  bool _isFieldAgeValid;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _ageController = TextEditingController();


  @override
  void initState() {
    if (widget.profile != null) {
      _isFieldNameValid = true;
      _nameController.text = widget.profile.name;
      _isFieldEmailValid = true;
      _emailController.text = widget.profile.email;
      _isFieldAgeValid = true;
      _ageController.text = widget.profile.age.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.profile == null ? "Form Add" : "Change Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldName(),
                _buildTextFieldEmail(),
                _buildTextFieldAge(),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RaisedButton(
                    child: Text(
                      widget.profile == null
                          ? "Submit".toUpperCase()
                          : "Update Data".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,

                      ),
                    ),
                    onPressed: () {
                      if (
                      _isFieldNameValid == null || _isFieldEmailValid == null ||
                          _isFieldAgeValid == null || !_isFieldNameValid ||
                          !_isFieldEmailValid || !_isFieldAgeValid
                      ) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(content: Text("Please fill all field"),),);
                        return;
                      }
                      setState(() => _isLoading = true);
                      String name = _nameController.text.toString();
                      String email = _emailController.text.toString();
                      int age = int.parse(_ageController.text.toString());

                      Profile profile = Profile(
                          name: name, email: email, age: age);
                      if (widget.profile == null) {
                        _apiService.createProfile(profile).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(
                                _scaffoldState.currentState.context, true
                            );
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Submit data failed"),));
                          }
                        });
                      }else{
                        _scaffoldState.currentState.showSnackBar(SnackBar(content: Text("Update data failed"),));
                      }
                    },
                    color: Colors.orange[600],
                  ),
                ),
              ],
            ),
          ),
          _isLoading ? Stack(
            children: <Widget>[
              Opacity(opacity: 0.3,child: ModalBarrier(
                dismissible: false,
                color: Colors.grey,
              ),
              ),
              Center(
              child: CircularProgressIndicator(),
              ),
            ],
          )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldName(){
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full Name",
            errorText: _isFieldNameValid == null || _isFieldNameValid ? null: "Full name is requied",
      ),
      onChanged: (nameValue){
        bool isFieldValue = nameValue.trim().isEmpty;
        if(isFieldValue != _isFieldNameValid){
          setState(() => _isFieldNameValid = isFieldValue);
        }
      },
      validator: (_nameController){
        if(_nameController.isEmpty){
          return "Please Enter your name";
        }
        return null;
      },
    );
  }


  Widget _buildTextFieldEmail(){
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Email",
        errorText: _isFieldEmailValid == null || _isFieldEmailValid ? null: "Email is requied",
      ),
      onChanged: (emailValue){
        bool isFieldValue = emailValue.trim().isEmpty;
        if(isFieldValue != _isFieldEmailValid){
          setState(() => _isFieldEmailValid = isFieldValue);
        }
      },
      validator: (_emailController){
        if(_emailController.isEmpty){
          return "Please Enter your email";
        }
        return null;
      },
    );
  }


  Widget _buildTextFieldAge(){
    return TextFormField(
      controller: _ageController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Age",
        errorText: _isFieldAgeValid == null || _isFieldAgeValid ? null: "Age is requied",
      ),
      onChanged: (ageValue){
        bool isFieldValue = ageValue.trim().isEmpty;
        if(isFieldValue != _isFieldAgeValid){
          setState(() => _isFieldAgeValid = isFieldValue);
        }
      },
      validator: (_ageController){
        if(_ageController.isEmpty){
          return "Please Enter your age";
        }
        return null;
      },
    );
  }






}