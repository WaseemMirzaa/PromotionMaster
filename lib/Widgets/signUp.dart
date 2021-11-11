import 'package:a_m_s/API/account/accountApiManager.dart';
import 'package:a_m_s/Models/user.dart';
import 'package:a_m_s/Pages/navigationPage.dart';
import 'package:flutter/material.dart';
import 'MobileVerificationBottomSheetWidget.dart';
import 'TextFIeldWidget.dart';

class SignUpPage extends StatelessWidget {
  final scaffoldState = GlobalKey<ScaffoldState>();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repeat_password = TextEditingController();
  UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.65), BlendMode.overlay),
                    image: AssetImage('assets/images/login-bg.png'),
                    fit: BoxFit.cover),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Welcome to AMS",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFieldWidget(
                              prefixIcon: Icons.person_outline,
                              hintText: "Username",
                              textEditingController: username),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 40, bottom: 5),
                                  child: Builder(builder: (context) {
                                    return Text(
                                      '+673',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    );
                                  }),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  controller: phone,
                                  decoration: InputDecoration(
                                    labelText: "     \tMobile No.",
                                    labelStyle:
                                        TextStyle(color: Color(0xFF5C5C5C)),
                                    border: InputBorder.none,
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    prefixText: '+673',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 25),
                                      child: Icon(
                                        Icons.phone_android,
                                      ),
                                    ),
                                    prefixStyle:
                                        TextStyle(color: Colors.transparent),
                                    hintText: "Mobile No.",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFieldWidget(
                              prefixIcon: Icons.email_outlined,
                              hintText: "Email",
                              textEditingController: email),
                          SizedBox(
                            height: 5,
                          ),
                          TextFieldWidget(
                              prefixIcon: Icons.lock_outline,
                              hintText: "Password",
                              obscureText: true,
                              textEditingController: password),
                          SizedBox(
                            height: 5,
                          ),
                          TextFieldWidget(
                              prefixIcon: Icons.lock_outline,
                              hintText: "Confirm Password",
                              obscureText: true,
                              textEditingController: repeat_password),
                          ListTile(
                            contentPadding: EdgeInsets.only(
                                top: 20, left: 15, right: 15, bottom: 10),
                            title: RaisedButton(
                              padding: EdgeInsets.all(13),
                              color: Color(0xFFFD2321),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              onPressed: () async {
                                if (username.text.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('User name is required.'),
                                  ));
                                } else if (phone.text.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('Phone Number is required.'),
                                  ));
                                } else if (email.text.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('Email is required.'),
                                  ));
                                } else if (password.text.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('Password is required.'),
                                  ));
                                } else if (repeat_password.text.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text('Confirm password is required.'),
                                  ));
                                } else if (repeat_password.text !=
                                    password.text) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        'Password and Confirm password must be same.'),
                                  ));
                                } else {
                                  userModel.username = username.text;
                                  userModel.phone = '+673' + phone.text;
                                  userModel.email = email.text;
                                  userModel.password = password.text;
                                  userModel.repeat_password =
                                      repeat_password.text;
                                  var bottomSheetController = scaffoldState
                                      .currentState!
                                      .showBottomSheet(
                                    (context) =>
                                        MobileVerificationBottomSheetWidget(
                                            currentUser: userModel),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                  );
                                  bottomSheetController.closed
                                      .then((value) async {
                                    print(userModel.verifiedPhone);
                                    if (userModel.verifiedPhone) {
                                      bool isSucess = await signUp(userModel);
                                      if (isSucess) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              'user registerd successfully.'),
                                        ));
                                        Navigator.of(context).pop();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text('Error in Authentication.'),
                                        ));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content:
                                            Text('Please verified phone no.'),
                                      ));
                                    }
                                    // _con.register();
                                  });
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Wrap(
                              direction: Axis.horizontal, //default
                              alignment: WrapAlignment.center,
                              children: [
                                Text("You have an account? ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.grey[
                                            400])), //you can use any other widget
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xFFFD2321)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
