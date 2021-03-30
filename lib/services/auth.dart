import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:day12_login/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// This file handles all the authentication services such as Log in and Sign Up.

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(id: user.uid) : null;
  }

  Stream<UserModel> get user {
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signUp(email, password) async {
    try {
      Fluttertoast.showToast(
          msg: "Signing you up!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user.uid)
          .set({'name': email, 'email': email});
      _userFromFirebaseUser(user.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: "The password is too weak.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "This email already exists. Use Another",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
        print('The account already exists for that email.Try another! ');
      } else if (email == null) {
        Fluttertoast.showToast(
            msg: "Please use a valid email id",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
      }
    } catch (e) {
      print(e);
    }
  }

  Future signIn(email, password) async {
    try {
      Fluttertoast.showToast(
          msg: "Logging you in!! Welcome Back !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
      User user = (await auth.signInWithEmailAndPassword(
          email: email, password: password)) as User;

      _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3);
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
