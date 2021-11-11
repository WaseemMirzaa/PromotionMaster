import 'package:flutter/material.dart';

class BackAndTitleWidget extends StatelessWidget {
  final String title;
  const BackAndTitleWidget(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, size: 25),
            ),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 9,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Quicksand',
                fontSize: 22,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        )
      ],
    );
  }
}
