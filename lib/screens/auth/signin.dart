// import 'dart:js';

import 'package:day12_login/FadeAnimation.dart';
import 'package:day12_login/components/rounded_input_field.dart';
import 'package:day12_login/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:day12_login/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUp(),
  ));
}

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              child: Column(children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/login_images/background.png'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: FadeAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/login_images/light-1.png'))),
                        )),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(
                        1.3,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/login_images/light-2.png'))),
                        )),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(
                        1.5,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/login_images/clock.png'))),
                        )),
                  ),
                  Positioned(
                    child: FadeAnimation(
                        1.6,
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                      1.8,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            // Container(
                            //   padding: EdgeInsets.all(8.0),
                            //   decoration: BoxDecoration(
                            //       border: Border(
                            //           bottom:
                            //               BorderSide(color: Colors.grey[100]))),
                            //   child: TextField(
                            //     onChanged: (val) => setState(() {
                            //       email = val;
                            //     }),
                            //     decoration: InputDecoration(
                            //         border: InputBorder.none,
                            //         hintText: "Email",
                            //         hintStyle:
                            //             TextStyle(color: Colors.grey[400])),
                            //   ),
                            // ),
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
                            // Container(
                            //   padding: EdgeInsets.all(8.0),
                            //   child: TextField(
                            //     onChanged: (val) => setState(() {
                            //       password = val;
                            //     }),
                            //     decoration: InputDecoration(
                            //         border: InputBorder.none,
                            //         hintText: "Password",
                            //         hintStyle:
                            //             TextStyle(color: Colors.grey[400])),
                            //   ),
                            // )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    2,
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ])),
                        child: ElevatedButton(
                          // ignore: sdk_version_set_literal
                          onPressed: () async =>
                              // ignore: sdk_version_set_literal
                              {
                            _authService.signIn(email, password),
                            Navigator.pushNamed(context, '/'),
                          },
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  // AlreadyHaveAnAccountCheck(
                  //   press: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) {
                  //       return Home();
                  //     }));
                  //   },
                  // ),
                  FadeAnimation(
                    1.5,
                    SizedBox(height: size.height * 0.03),
                  )
                  // FadeAnimation(
                  //   1.5,
                  //   RichText(
                  //     text: TextSpan(
                  //       text: 'Dont Have a Account ',
                  //       style:
                  //           TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //           text: 'Create One!',
                  //         ),
                  //         TextSpan(
                  //             text: ' click here!',
                  //             recognizer: TapGestureRecognizer()
                  //               ..onTap = () => Navigator.push(context,
                  //                       MaterialPageRoute(builder: (context) {
                  //                     return SignUpScreen();
                  //                   }))),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ])),
        ));
  }
}
