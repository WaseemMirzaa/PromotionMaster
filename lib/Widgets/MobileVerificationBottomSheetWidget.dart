import 'package:a_m_s/Models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MobileVerificationBottomSheetWidget extends StatefulWidget {
  final UserModel currentUser;

  MobileVerificationBottomSheetWidget({Key? key, required this.currentUser})
      : super(key: key);

  @override
  _MobileVerificationBottomSheetWidgetState createState() =>
      _MobileVerificationBottomSheetWidgetState();
}

class _MobileVerificationBottomSheetWidgetState
    extends State<MobileVerificationBottomSheetWidget> {
  String? smsSent;
  String? errorMessage;

  @override
  void initState() {
    verifyPhone();
    super.initState();
  }

  verifyPhone() async {
    widget.currentUser.verificationId = '';
    smsSent = '';
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {};
    final PhoneCodeSent smsCodeSent = (String verId, [int? forceCodeResent]) {
      widget.currentUser.verificationId = verId;
    } as PhoneCodeSent;
    final PhoneVerificationCompleted _verifiedSuccess =
        (AuthCredential auth) {};
    final PhoneVerificationFailed _verifyFailed = (FirebaseAuthException e) {};
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.currentUser.phone!,
      timeout: const Duration(seconds: 120),
      verificationCompleted: _verifiedSuccess,
      verificationFailed: _verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).focusColor.withOpacity(0.4),
              blurRadius: 30,
              offset: Offset(0, -30)),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: ListView(
              padding:
                  EdgeInsets.only(top: 40, bottom: 15, left: 20, right: 20),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Verify Phone Number',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    errorMessage == null
                        ? Text(
                            'We are sending OTP to validate your mobile number. Hang on!',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            errorMessage ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .merge(TextStyle(color: Colors.white)),
                            textAlign: TextAlign.center,
                          ),
                  ],
                ),
                SizedBox(height: 30),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .merge(TextStyle(letterSpacing: 15)),
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).focusColor.withOpacity(0.2)),
                    ),
                    focusedBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                        color: Theme.of(context).focusColor.withOpacity(0.3),
                      ),
                    ),
                    hintText: '------',
                  ),
                  maxLength: 6,
                  onChanged: (value) {
                    this.smsSent = value;
                  },
                ),
                SizedBox(height: 15),
                Text(
                  'SMS has been sent to' + widget.currentUser.phone!,
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 80),
                RaisedButton(
                  onPressed: () async {
                    User? user = FirebaseAuth.instance.currentUser;
                    print(user.toString());
                    final AuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.currentUser.verificationId!,
                            smsCode: smsSent!);

                    await FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((user) {
                      widget.currentUser.verifiedPhone = true;
                      Navigator.of(context).pop();
                    }).catchError((e) {
                      setState(() {
                        errorMessage = e.toString().split('\]').last;
                      });
                      print(e.toString());
                    });
                  },
                  color: Theme.of(context).accentColor,
                  child: Text('Verify',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .merge(TextStyle(color: Colors.white))),
                ),
                RaisedButton(
                  onPressed: () async {
                    verifyPhone();
                  },
                  color: Theme.of(context).accentColor,
                  child: Text('Resend',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .merge(TextStyle(color: Colors.white))),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 42),
            decoration: BoxDecoration(
              color: Theme.of(context).focusColor.withOpacity(0.05),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Container(
              width: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
