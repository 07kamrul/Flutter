import 'package:signin_signup_cts/data/database-helper.dart';
import 'package:signin_signup_cts/models/user.dart';

class RestData {
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password) async {
    String flagLogged = "logged";
    //var user = new User(null, username, password, null);
    var user = new User(username:username, password:password, flaglogged:null);
    var db = new DatabaseHelper();
    var userRetorno = new User();
    userRetorno = await db.seleteUser(user);
    if (userRetorno != null) {
      flagLogged = "logged";
      return new Future.value(new User(username:username, password:password, flaglogged:flagLogged));
    } else {
      flagLogged = "not";
      return new Future.value(new User(username:username, password:password, flaglogged:flagLogged));
    }
  }
}
