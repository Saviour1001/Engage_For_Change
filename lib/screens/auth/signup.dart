import 'package:day12_login/components/rounded_button.dart';
import 'package:day12_login/components/rounded_input_field.dart';
import 'package:day12_login/components/rounded_password_field.dart';
import 'package:day12_login/screens/Signup/components/background.dart';
import 'package:day12_login/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  final AuthService _authService = AuthService();
  String email = '';
  String password = '';
  final formkey1 = GlobalKey<FormState>();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget build(BuildContext context) {
    // static MediaQueryData of(BuildContext context, { bool nullOk = false });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Background(
            child: SingleChildScrollView(
      child: new Form(
        key: formkey1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (val) => setState(() {
                String emails =
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                bool isValid = RegExp(emails).hasMatch(val);
                if (isValid == true) {
                  email = val;
                } else {
                  email = null;
                }
              }),
            ),
            RoundedPasswordField(
              onChanged: (value) => setState(() {
                password = value;
              }),
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async => {
                if (formkey1.currentState.validate())
                  {
                    _authService.signUp(email, password),
                    Navigator.pushNamed(context, '/'),
                  }
              },
            ),
            Divider(),
          ],
        ),
      ),
    )));
  }
}
