import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Center(child: Text('Sign In')),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 0.0),
        child: Column(
          children: <Widget>[
            TextFormField(
            validator: ,
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
