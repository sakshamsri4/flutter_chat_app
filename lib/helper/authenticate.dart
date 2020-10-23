import 'package:chat_app_flutter/Screens/signUp.dart';
import 'package:chat_app_flutter/Screens/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? Center(child: SignIn(toggleView))
        : Center(child: SignUp(toggleView));
  }
}
