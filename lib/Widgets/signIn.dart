import 'package:a_m_s/API/account/accountApiManager.dart';
import 'package:a_m_s/Models/user.dart';
import 'package:a_m_s/Pages/navigationPage.dart';
import 'package:a_m_s/Widgets/signUp.dart';
import 'package:flutter/material.dart';
import 'TextFIeldWidget.dart';

class SignInPage extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Login to your account",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[400]),
                        ),
                        TextFieldWidget(
                          prefixIcon: Icons.email_outlined,
                          hintText: "Username",textEditingController: username,),
                        SizedBox(
                          height: 5,
                        ),
                        TextFieldWidget(
                          prefixIcon: Icons.lock_outline,
                          hintText: "Password",
                          obscureText: true,textEditingController: password,),
                        ListTile(
                          contentPadding:
                          EdgeInsets.only(top: 20, left: 15, right: 15,bottom: 10),
                          title: RaisedButton(
                            padding: EdgeInsets.all(13),
                            color: Color(0xFFFD2321),
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            onPressed: () async {
                              if(username.text.isEmpty)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('User name is required.'),
                                ));
                              }else if(password.text.isEmpty)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Password is required.'),
                                ));
                              }else{
                                UserModel userModel = UserModel();
                                userModel.username = username.text;
                                userModel.password = password.text;
                                bool isSucess = await Login(userModel);
                                if(isSucess){
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NavigationPage(),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text('Error in Authentication.'),
                                  ));
                                }
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        InkWell(
                          onTap: ()  {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                          },
                          child:
                          Wrap(
                            direction: Axis.horizontal, //default
                            alignment: WrapAlignment.center,
                            children: [
                              Text("Dont have an account? ",style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.grey[400]
                              )),   //you can use any other widget
                              Text("Create an Account",style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Color(0xFFFD2321)
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ) ),
            )
          ),


        ],
      ),
    );
  }
}
