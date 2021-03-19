import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day12_login/models/user.dart';
import 'package:day12_login/screens/main/posts/list.dart';
import 'package:day12_login/services/posts.dart';
import 'package:day12_login/services/user.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PostService _postService = PostService();
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    final String uid = ModalRoute.of(context).settings.arguments;
    return MultiProvider(
        providers: [
          StreamProvider.value(
            value: _postService.getPostsByUser(uid),
          ),
          StreamProvider.value(
            value: _userService.getUserInfo(uid),
          )
        ],
        child: Scaffold(
            body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder: (context, _) {
                return [
                  SliverAppBar(
                    floating: false,
                    pinned: true,
                    expandedHeight: 130,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Image.network(
                      Provider.of<UserModel>(context).bannerImageUrl ?? '',
                      fit: BoxFit.cover,
                    )),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Provider.of<UserModel>(context)
                                            .profileImageUrl !=
                                        ''
                                    ? CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            Provider.of<UserModel>(context)
                                                .profileImageUrl),
                                      )
                                    : Icon(Icons.person, size: 50),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/edit');
                                    },
                                    child: Text("Edit Profile"))
                              ]),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                Provider.of<UserModel>(context).name ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]))
                ];
              },
              body: ListPosts()),
        )));
  }
}
