import 'dart:convert';
import 'dart:ui';
import 'package:a_m_s/API/Device/deviceIdApiManager.dart';
import 'package:a_m_s/API/apiRoutes.dart';
import 'package:a_m_s/API/httpClient.dart';
import 'package:a_m_s/Models/DeviceId/DeviceIdModel.dart';
import 'package:a_m_s/Models/Products/productApiModel.dart';
import 'package:a_m_s/Utilities/Constant.dart';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShareYourProduct extends StatefulWidget {
  final ProductModel productModel;
  const ShareYourProduct(this.productModel, {Key? key}) : super(key: key);

  @override
  _ShareYourProductState createState() => _ShareYourProductState();
}

class _ShareYourProductState extends State<ShareYourProduct> {
  final double heightAndWidth = 80;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String? platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterSocialContentShare.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    print("platformVersion" + platformVersion!);

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  Future<String> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  Future<bool> callApi(String email) async {
    try {
      Map<String, String> map1 = {'email_id': email};
      var encodeBody = json.encode(map1);
      var response = await postHttpCall(APIRoute.postEmail(), encodeBody);

      print("submitContactUsFormToServer() " +
          response.statusCode.toString() +
          "Body " +
          response.body);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['RESPONSE_FLAG'] == "Success") {
          // Navigator.of(context).pop();
          final prefs = await SharedPreferences.getInstance();

// set value
          prefs.setString('email', email);
          Fluttertoast.showToast(
              msg: "Successfully Submitted",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          return true;
        }
        Fluttertoast.showToast(
            msg: "Submission Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        return false;
      } else {
        Fluttertoast.showToast(
            msg: "Submission Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        return false;
      }
    } catch (ex) {
      print("Exception while submitContactUsFormToServer()" + ex.toString());
      Fluttertoast.showToast(
          msg: "Submission Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
  }

  String emailId = '';

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Submit Your Email for Lucky Draw'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  onChanged: (text) {
                    setState(() {
                      emailId = text;
                    });
                  },
                  autofocus: true,
                  decoration:
                      new InputDecoration(labelText: '', hintText: 'Email'),
                ),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();

                callApi(emailId);
              },
            ),
          ],
        );
      },
    );
  }

  /// SHARE ON FACEBOOK CALL
  _shareOnFacebook() async {
    String? shareResult = await FlutterSocialContentShare.share(
        type: ShareType.facebookWithoutImage,
        url: widget.productModel.shareLink,
        quote: "");
    bool isSucess = false;

    if (isSucess == true) {
      final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
      final counter = prefs.getString('email') ?? "";

      if (counter.isEmpty == true) {
        _showMyDialog();
      }
    }
    // String deviceid = await _getId();

    // DeviceIdModel deviceIdModel = new DeviceIdModel(Constant.userModel.email!);
    // //  isSucess = await submitDeviceIdToServer(deviceIdModel);
    print("_shareOnFacebook()" + shareResult!);
  }

  /// SHARE ON INSTAGRAM CALL
  _shareOnInstagram() async {
    String? result = await FlutterSocialContentShare.share(
        type: ShareType.instagramWithImageUrl,
        imageUrl: widget.productModel.bigImage);
    bool isSucess = false;
    // String deviceid = await _getId();

    if (isSucess == true) {
      _showMyDialog();
    }
    // DeviceIdModel deviceIdModel = new DeviceIdModel(Constant.userModel.email!);
    // isSucess = await submitDeviceIdToServer(deviceIdModel);
    print("_shareOnInstagram()" + result!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title and close icon
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Share your Product', //title text
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(Icons.close),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ) //close icon
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Facebook
              GestureDetector(
                onTap: () async {
                  await _shareOnFacebook();
                  // _showMyDialog();
                },
                child: Container(
                  height: heightAndWidth,
                  width: heightAndWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "f", //facebook center text
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              // Insta
              // GestureDetector(
              //   onTap: () async {
              //     await _shareOnInstagram();
              //   },
              //   child: Container(
              //     height: heightAndWidth,
              //     width: heightAndWidth,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Colors.red,
              //     ),
              //     child: Center(
              //       child: Image.asset(
              //         "assets/images/insta.jpg", //instagram
              //       ),
              //     ),
              //   ),
              // ),

              // Copy
              GestureDetector(
                onTap: () async {
                  Clipboard.setData(
                      ClipboardData(text: widget.productModel.shareLink));
                  Fluttertoast.showToast(
                      msg: "Copied",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
                  final counter = prefs.getString('email') ?? "";

                  if (counter.isEmpty == true) {
                    _showMyDialog();
                  }
                },
                child: Container(
                  height: heightAndWidth,
                  width: heightAndWidth,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Image.asset(
                    "assets/images/link.png",
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
