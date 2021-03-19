import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day12_login/screens/main/profile/list.dart';
import 'package:day12_login/services/user.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  UserService _userService = UserService();
  String search = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
        child: StreamProvider.value(
          value: _userService.queryByName(search),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      search = text;
                    });
                  },
                  decoration: InputDecoration(hintText: 'Search...'),
                ),
              ),
              ListUsers()
            ],
          ),
        ),
      )
    ]));
  }
}
