import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day12_login/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:day12_login/screens/wrapper.dart';
import 'package:day12_login/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          //return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<UserModel>.value(
            value: AuthService().user,
            initialData: null,
            child: MaterialApp(home: Wrapper()),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text("Loading");
      },
    );
  }
}
