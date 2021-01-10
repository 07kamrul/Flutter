class User{
  String name;
  String username;
  String password;
  String flaglogged;

  User({this.name, this.username, this.password, this.flaglogged});

  User.map(dynamic obj){
    this.name = obj['name'];
    this.username = obj['username'];
    this.password = obj['password'];
    this.flaglogged = obj['password'];
  }

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["username"] = username;
    map['password'] = password;
    map['flaglogged'] = flaglogged;
    return map;
  }

}