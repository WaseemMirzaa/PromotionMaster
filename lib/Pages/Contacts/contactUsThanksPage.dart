import 'package:a_m_s/Widgets/Contact/contactUsDetailsWidget.dart';
import 'package:a_m_s/Widgets/backAndTitleWidget.dart';
import 'package:flutter/material.dart';

class ContactUsThanksPage extends StatelessWidget {
  const ContactUsThanksPage({Key? key}) : super(key: key);

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
                BackAndTitleWidget('Contact'),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/thanks.png',
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Thank you for the email and we will contact you back as soon as possible.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                SizedBox(
                  height: 50,
                ),
                ContactUsDetailsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
