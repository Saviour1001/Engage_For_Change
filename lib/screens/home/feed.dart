import 'package:day12_login/services/feed1.dart';
import 'package:flutter/material.dart';
import 'package:day12_login/screens/home/items.dart';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoadDataFromFirestore(),
    );
  }
}
