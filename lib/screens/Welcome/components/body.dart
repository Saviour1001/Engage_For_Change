import 'package:flutter/material.dart';
import 'package:day12_login/screens/auth/signin.dart';
import 'package:day12_login/components/rounded_button.dart';
import 'package:day12_login/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:day12_login/screens/auth/signup.dart';
import 'package:day12_login/screens/Welcome/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Engage For Change",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new SignUp()));
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SignUpScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
