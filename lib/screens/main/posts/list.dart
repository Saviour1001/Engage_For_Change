import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day12_login/models/post.dart';

class ListPosts extends StatefulWidget {
  ListPosts({Key key}) : super(key: key);

  @override
  _ListPostsState createState() => _ListPostsState();
}

class _ListPostsState extends State<ListPosts> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<PostModel>>(context) ?? [];

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(post.orgName),
          subtitle: Text(post.orgContact),
          trailing: Text(post.jobTitle),
        );
      },
    );
  }
}
