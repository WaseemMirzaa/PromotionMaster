import 'dart:convert';

import 'package:a_m_s/Models/ContactUs/contactUsApiResponseModel.dart';
import 'package:a_m_s/Models/ContactUs/sendContactUsModel.dart';

import '../apiRoutes.dart';
import '../httpClient.dart';

Future<bool> submitContactUsFormToServer(
    SendContactUsModel contactUsModel) async {
  try {
    var encodeBody = json.encode(contactUsModel.toJson());
    var response = await postHttpCall(APIRoute.getContactUsURL(), encodeBody);

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
