import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pushNamed(context, '/');
    return true;
  }

  Widget build(BuildContext context) {
    final String uid = ModalRoute.of(context).settings.arguments;
    return MultiProvider(
        providers: [
          StreamProvider.value(
            value: _userService.isFollowing(
                FirebaseAuth.instance.currentUser.uid, uid),
          ),
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
                                if (FirebaseAuth.instance.currentUser.uid ==
                                    uid)
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/edit');
                                      },
                                      child: Text("Edit Profile"))
                                else if (FirebaseAuth
                                            .instance.currentUser.uid !=
                                        uid &&
                                    !Provider.of<bool>(context))
                                  TextButton(
                                      onPressed: () {
                                        _userService.followUser(uid);
                                      },
                                      child: Text("Follow"))
                                else if (FirebaseAuth
                                            .instance.currentUser.uid !=
                                        uid &&
                                    Provider.of<bool>(context))
                                  TextButton(
                                      onPressed: () {
                                        _userService.unfollowUser(uid);
                                      },
                                      child: Text("Unfollow")),
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
  // Widget build(BuildContext context) {
  //   final String uid = ModalRoute.of(context).settings.arguments;
  //   return MultiProvider(
  //     providers: [
  //       StreamProvider.value(
  //         value: _userService.isFollowing(
  //             FirebaseAuth.instance.currentUser.uid, uid),
  //       ),
  //       StreamProvider.value(
  //         value: _postService.getPostsByUser(uid),
  //       ),
  //       StreamProvider.value(
  //         value: _userService.getUserInfo(uid),
  //       )
  //     ],
  //     child: Scaffold(
  //       body: new Stack(
  //         children: <Widget>[
  //           new Image.network(
  //             Provider.of<UserModel>(context).bannerImageUrl ?? '',
  //             fit: BoxFit.fitHeight,
  //             height: 130,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
