import 'dart:convert';

import 'package:a_m_s/Models/ContactUs/contactUsApiResponseModel.dart';
import 'package:a_m_s/Models/DeviceId/DeviceIdModel.dart';
import 'package:a_m_s/Models/user.dart';
import 'package:a_m_s/Utilities/Constant.dart';

import '../apiRoutes.dart';
import '../httpClient.dart';

Future<bool> Login(
    UserModel userModel) async {
  try {
    var encodeBody = json.encode(userModel.toMap());
    var response = await postHttpCall(APIRoute.postUserSignInURL(), encodeBody);

    print("submitContactUsFormToServer() " +
        response.statusCode.toString() +
        "Body " +
        response.body);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      jsonData['data'].forEach((v) {
        Constant.userModel = UserModel.fromJSON(v);
      });
      if (jsonData['RESPONSE_FLAG'] == "Success") {
        return true;
      }
      return false;
    } else {
      return false;
    }
  } catch (ex) {
    print("Exception while submitContactUsFormToServer()" + ex.toString());
    return false;
  }
}

Future<bool> signUp(
    UserModel userModel) async {
  try {
    var encodeBody = json.encode(userModel.toMap());
    var response = await postHttpCall(APIRoute.postUserSignUpURL(), encodeBody);

    print("submitContactUsFormToServer() " +
        response.statusCode.toString() +
        "Body " +
        response.body);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var parseResponse = ContactUsApiResponseModel.fromJson(jsonData);
      if (parseResponse.responseFlag == "Success") {
        return true;
      }
      return false;
    } else {
      return false;
    }
  } catch (ex) {
    print("Exception while submitContactUsFormToServer()" + ex.toString());
    return false;
  }
}