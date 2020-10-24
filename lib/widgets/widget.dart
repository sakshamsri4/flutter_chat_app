import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
      title: Container(
    child: Text(
      'Chattttty',
      style: TextStyle(
        fontSize: 25,
        color: Colors.blueGrey,
        fontFamily: "Roboto",
      ),
    ),
  )
      /*Image.asset(
      "assets/images/logo.png",
      height: 50.0,*/
      );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.italic,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
}

TextStyle mediumTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 17);
}
