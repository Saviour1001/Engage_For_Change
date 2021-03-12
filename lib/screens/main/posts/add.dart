import 'package:flutter/material.dart';
import 'package:prototype/services/posts.dart';

class Add extends StatefulWidget {
  Add({Key key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  String orgName = '';
  String orgContact = '';
  String jobType = '';
  String jobDescription = '';

  final PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Post here"),
        actions: <Widget>[
          FlatButton(
              textColor: Colors.white,
              onPressed: () async {
                _postService.savePost(
                    orgName, orgContact, jobType, jobDescription);
                Navigator.pop(context);
              },
              child: Text("Post your Job!!"))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: new Form(
              child: TextFormField(
                onChanged: (val) {
                  setState(() {
                    orgName = val;
                  });
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: new Form(
              child: TextFormField(
                onChanged: (val) {
                  setState(() {
                    orgContact = val;
                  });
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: new Form(
              child: TextFormField(
                onChanged: (val) {
                  setState(() {
                    jobType = val;
                  });
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: new Form(
              child: TextFormField(
                onChanged: (val) {
                  setState(() {
                    jobDescription = val;
                  });
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
