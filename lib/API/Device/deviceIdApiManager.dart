import 'dart:convert';

import 'package:a_m_s/Models/ContactUs/contactUsApiResponseModel.dart';
import 'package:a_m_s/Models/DeviceId/DeviceIdModel.dart';

import '../apiRoutes.dart';
import '../httpClient.dart';

Future<bool> submitDeviceIdToServer(
    DeviceIdModel deviceIdModel) async {
  try {
    var encodeBody = json.encode(deviceIdModel.toJson());
    var response = await postHttpCall(APIRoute.postDeviceIdURL(), encodeBody);

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