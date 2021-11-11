
class UserModel {
  String? user_id;
  String? username;
  String? phone;
  String? email;
  String? password;
  String? repeat_password;
  bool verifiedPhone = false;
  String? verificationId;
  // used for indicate if client logged in or not

//  String role;

  UserModel();

  UserModel.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      user_id = jsonMap['user_id'];
      username = jsonMap['username'];
      phone = jsonMap['phone'] != null ? jsonMap['phone'] : '';
      email = jsonMap['email'] != null ? jsonMap['email'] : '';
    } catch (e) {
      print(e);
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["email"] = email;
    map["phone"] = phone;
    map["password"] = password;
    map["repeat_password"] = repeat_password;
    return map;
  }

}
