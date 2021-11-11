import 'package:flutter/material.dart';

class CountBadgeWidget extends StatelessWidget {
  final int _counter;
  final IconData _icon;
  const CountBadgeWidget(this._icon, this._counter, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          _icon,
          size: 30,
        ),
        Container(
          width: 20,
          height: 20,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Color.fromRGBO(252, 42, 28, 1),
            borderRadius: BorderRadius.all(Radius.elliptical(19, 19)),
          ),
          child: Text(
            '$_counter',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 12,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ),
      ],
    );
  }
}
