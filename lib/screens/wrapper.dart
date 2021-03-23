import 'package:day12_login/screens/home/ideation.dart';
import 'package:day12_login/screens/main/aboutUs.dart';
import 'package:day12_login/screens/main/posts/magnified.dart';
import 'package:day12_login/services/feed1.dart';
import 'package:flutter/material.dart';
import 'package:day12_login/models/user.dart';
import 'package:day12_login/screens/auth/signin.dart';
import 'package:day12_login/screens/auth/signup.dart';
import 'package:day12_login/screens/main/home.dart';
import 'package:day12_login/screens/main/posts/add.dart';
import 'package:day12_login/screens/main/profile/edit.dart';
import 'package:day12_login/screens/main/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:day12_login/screens/Welcome/welcome_screen.dart';
import 'package:day12_login/screens/home/explain.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    print(user);
    if (user == null) {
      //show auth system routes
      return WelcomeScreen();
    }

    //show main system routes
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/idea': (context) => idea(),
        '/add': (context) => Add(),
        '/profile': (context) => Profile(),
        '/edit': (context) => Edit(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => SignUp(),
        '/aboutUs': (context) => AboutUs(),
        '/exp': (context) => LoadDataFromFirestore(),
        '/explain': (context) => idea(),
      },
    );
  }
}
