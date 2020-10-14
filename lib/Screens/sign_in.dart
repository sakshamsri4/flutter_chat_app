import 'package:chat_app_flutter/Screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FlutterLogo(
                  size: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Login Here',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .90,
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Email'),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "This Field is required"),
                            EmailValidator(errorText: "Invalid Email Address")
                          ]),
                          onChanged: (val) {
                            _email = val;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password'),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Password is required"),
                              EmailValidator(
                                  errorText: "Minimum 6 Characters Required")
                            ]),
                            onChanged: (val) {
                              _password = val;
                            },
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {},
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text('Login'),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Image(
                            image: AssetImage('assets/signInWithGoogle.png'),
                            width: 200.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUp()));
                          },
                          child: Text('Sign Up here'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
