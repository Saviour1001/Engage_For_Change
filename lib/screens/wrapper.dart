import 'package:flutter/material.dart';
import 'package:practice/models/user.dart';
import 'package:practice/screens/auth/signup.dart';
import 'package:practice/screens/main/home.dart';
import 'package:practice/screens/main/posts/add.dart';
import 'package:practice/screens/main/profile/edit.dart';
import 'package:practice/screens/main/profile/profile.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    print(user);
    if (user == null) {
      //show auth system routes
      return SignUp();
    }

    //show main system routes
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/add': (context) => Add(),
        '/profile': (context) => Profile(),
        '/edit': (context) => Edit()
      },
    );
  }
}
