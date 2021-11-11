import 'package:a_m_s/StateManagment/ContactUs/contactUsProviderModel.dart';
import 'package:a_m_s/Utilities/utility.dart';
import 'package:a_m_s/Widgets/Contact/contactUsDetailsWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contactUsThanksPage.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 60, 15, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Contact
                Text(
                  'Contact',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                SizedBox(
                  height: 20,
                ),
                // Contact us
                Text(
                  'Contact Us',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                SizedBox(
                  height: 10,
                ),

                // Contact form
                Consumer<ContactUsProviderModel>(
                  builder: (context, myModel, child) {
                    return Form(
                      key: myModel.getFormKey(),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            getFormTitle('Name'),
                            TextFormField(
                              controller: myModel.nameController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textAlign: TextAlign.left,
                              maxLength: 100,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15.0),
                              ),
                              style: TextStyle(
                                  color: Color.fromRGBO(94, 94, 94, 1),
                                  fontFamily: 'Quicksand',
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),

                            getFormTitle('Email '),
                            TextFormField(
                              controller: myModel.emailController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textAlign: TextAlign.left,
                              maxLength: 50,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!isValidEmail(value)) {
                                  return "Please enter a valid email address";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15.0),
                              ),
                              style: TextStyle(
                                  color: Color.fromRGBO(94, 94, 94, 1),
                                  fontFamily: 'Quicksand',
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),

                            getFormTitle('Message'),
                            TextFormField(
                              controller: myModel.messageController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textAlign: TextAlign.left,
                              maxLength: 500,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your message.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15.0),
                              ),
                              style: TextStyle(
                                  color: Color.fromRGBO(94, 94, 94, 1),
                                  fontFamily: 'Quicksand',
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Send Us Button
                            Align(
                              alignment: Alignment.centerRight,
                              child: myModel.isSending()
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : GestureDetector(
                                      onTap: () async {
                                        if (myModel
                                            .getFormKey()
                                            .currentState!
                                            .validate()) {
                                          if (await myModel.sendContactUs()) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      ContactUsThanksPage()),
                                            );
                                          } else {
                                            SnackBar snackBar = new SnackBar(
                                                content: Text(
                                                    "Unable to submit your query, please try again later."));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        } else {
                                          SnackBar snackBar = new SnackBar(
                                              content:
                                                  Text("Form is not valid"));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      },
                                      child: Container(
                                        width: 112,
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            'Send',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontFamily: 'Quicksand',
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          color: Color.fromRGBO(253, 33, 33, 1),
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 242, 242, 1),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),

                ContactUsDetailsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getFormTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color.fromRGBO(94, 94, 94, 1),
            fontFamily: 'Quicksand',
            fontSize: 12,
            letterSpacing:
                0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1),
      ),
    );
  }
}
