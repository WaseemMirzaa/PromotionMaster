import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
   TextFieldWidget({Key? key,
     this.textEditingController,
     this.prefixIcon,
    this.hintText,
    this.sulfixIcon,
     this.obscureText = false}) : super(key: key);

  IconData? prefixIcon;
      String? hintText;
  IconData? sulfixIcon;
  bool obscureText = false;
  TextEditingController? textEditingController;


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        obscureText: obscureText,
        controller: textEditingController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 25),
            child: Icon(
              prefixIcon,
            ),
          ),
          labelText: hintText,
          labelStyle: TextStyle(color: Color(0xFF5C5C5C)),
          border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF5C5C5C)),
          contentPadding: EdgeInsets.all(15),
          suffixIcon: sulfixIcon != null
              ? Padding(
            padding: const EdgeInsets.only(left: 25, right: 12),
            child: Icon(
              sulfixIcon,
            ),
          )
              : SizedBox(
            width: 1,
            height: 1,
          ),
        ),
      ),
    );
  }
}
