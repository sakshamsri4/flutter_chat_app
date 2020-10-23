import 'package:chat_app_flutter/Screens/chatRoomScreen.dart';
import 'package:chat_app_flutter/helper/helperFunctions.dart';
import 'package:chat_app_flutter/services/auth.dart';
import 'package:chat_app_flutter/services/database.dart';
import 'package:chat_app_flutter/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  bool isLoading = false;
  QuerySnapshot snapshotUserInfo;
  signIn() {
    if (formKey.currentState.validate()) {
      HelperFunctions.saveUserEmailSharedPreference(
          emailTextEditingController.text);

      databaseMethods
          .getUserByUserEmail(emailTextEditingController.text)
          .then((val) {
        snapshotUserInfo = val;
        HelperFunctions.saveUserNameSharedPreference(
            snapshotUserInfo.documents[0].data["name"]);
      });
      setState(() {
        isLoading = true;
      });

      authMethods
          .signInWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
        if (value != null) {
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        }
        if (value == null) {
          print("Value is null");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 250,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val)
                              ? null
                              : "Please provide a valid email address";
                        },
                        controller: emailTextEditingController,
                        decoration: textFieldInputDecoration('email'),
                        style: simpleTextStyle(),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val) {
                          return val.length > 6
                              ? null
                              : "Please provide password 6+ characters";
                        },
                        controller: passwordTextEditingController,
                        decoration: textFieldInputDecoration('password'),
                        style: simpleTextStyle(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    authMethods.resetPass(emailTextEditingController.text);
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Forgot Password?",
                      style: simpleTextStyle(),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    signIn();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xff007EF4),
                          const Color(0xff2A75BC)
                        ]),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'Sign In With Google',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: mediumTextStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
