import 'package:flutter/material.dart';
import 'package:day12_login/components/rounded_button.dart';
import 'package:day12_login/components/rounded_input_field.dart';
import 'package:day12_login/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:day12_login/services/auth.dart';
import 'package:day12_login/screens/Signup/components/background.dart';

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
  Widget build(BuildContext context) {
    // static MediaQueryData of(BuildContext context, { bool nullOk = false });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Background(
      child: SingleChildScrollView(
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
                email = val;
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
                _authService.signUp(email, password),
                Navigator.pushNamed(context, '/')
              },
            ),
            Divider(),
          ],
        ),
      ),
    ));
  }
}
