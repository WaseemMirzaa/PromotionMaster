import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsDetailsWidget extends StatelessWidget {
  const ContactUsDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contact us title
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Contact Detail',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Quicksand',
                fontSize: 18,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ),
        // Contact Details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getContactDetailTitle('Address'),
            getContactDetailValue(
                'Progress Trading Co Sdn Bhd Lot No 12026, Simpang 15 KG Menglait Jln Gadong Bandar Seri Begawan BE4119 Negara Brunei Darussalam P.o Box 506 , BSB BS8611'),
            SizedBox(
              height: 10,
            ),
            // Telephone and Workshop
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getContactDetailTitle('Telephone'),
                      GestureDetector(
                        onTap: () async {
                          _makePhoneCall('tel:+6732425795');
                        },
                        child: getContactDetailValue('+6732425795'),
                      ),
                      GestureDetector(
                        onTap: () async {
                          _makePhoneCall('tel:+6732446646');
                        },
                        child: getContactDetailValue('+6732446646'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getContactDetailTitle('Workshop'),
                      GestureDetector(
                        onTap: () async {
                          _makePhoneCall('tel:+6732421206');
                        },
                        child: getContactDetailValue('+6732421206'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Fax and Direct
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getContactDetailTitle('Fax'),
                      getContactDetailValue('+673 2420871'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getContactDetailTitle('Direct'),
                      GestureDetector(
                        onTap: () async {
                          _makePhoneCall('tel:+6738757911');
                        },
                        child: getContactDetailValue('+6738757911',
                            optionText: " Vincent"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Email and Facbook
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getContactDetailTitle('Email'),
                      getContactDetailValue('biz.ptcbrunei@gmail.com'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getContactDetailTitle('Facebook'),
                      getContactDetailValue('Amsoil Brunei'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            getContactDetailTitle('Website'),
            getContactDetailValue('www.ptcbrunei.com'),
          ],
        )
      ],
    );
  }

  Widget getContactDetailTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color.fromRGBO(94, 94, 94, 1),
            fontFamily: 'Quicksand',
            fontSize: 12,
            fontWeight: FontWeight.normal,
            height: 1),
      ),
    );
  }

  Widget getContactDetailValue(String text, {String optionText = ""}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text + optionText,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color.fromRGBO(35, 31, 32, 1),
            fontFamily: 'Quicksand',
            fontSize: 12,
            fontWeight: FontWeight.normal,
            height: 1),
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Unable to launch the " + url);
    }
  }
}
