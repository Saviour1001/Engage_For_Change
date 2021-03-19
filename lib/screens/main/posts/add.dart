import 'package:flutter/material.dart';
import 'package:day12_login/services/posts.dart';

class Add extends StatefulWidget {
  Add({Key key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  String orgName = '';
  String orgContact = '';
  String State = '';
  String City = '';
  String Address = '';
  String jobTitle = '';
  String jobDescription = '';

  final PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Post here"),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
                textColor: Colors.white,
                onPressed: () async {
                  _postService.savePost(orgName, orgContact, State, City,
                      Address, jobTitle, jobDescription);
                  Navigator.pop(context);
                },
                child: Text("Post your Job!!"))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              // Organization Name
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: new Form(
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      orgName = val;
                    });
                  },
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                      suffixIcon: const Icon(
                          IconData(0xe61e, fontFamily: 'MaterialIcons')),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Organization Name/Group Name"),
                ),
              ),
            ),
            Container(
              // Organization Contact Number
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: new Form(
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      orgContact = val;
                    });
                  },
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                      suffixIcon:
                          Icon(IconData(57608, fontFamily: 'MaterialIcons')),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Contact Number"),
                ),
              ),
            ),
            Container(
              // State
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: new Form(
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      State = val;
                    });
                  },
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                      suffixIcon:
                          Icon(IconData(59453, fontFamily: 'MaterialIcons')),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "State"),
                ),
              ),
            ),
            Container(
              // City
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: new Form(
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      City = val;
                    });
                  },
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                      suffixIcon:
                          Icon(IconData(59453, fontFamily: 'MaterialIcons')),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "City"),
                ),
              ),
            ),
            Container(
              // Address
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: new Form(
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      Address = val;
                    });
                  },
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                      suffixIcon:
                          Icon(IconData(60190, fontFamily: 'MaterialIcons')),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Address"),
                ),
              ),
            ),
            Container(
              // Job Title
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: new Form(
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      jobTitle = val;
                    });
                  },
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                      suffixIcon:
                          Icon(IconData(59047, fontFamily: 'MaterialIcons')),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Job Title"),
                ),
              ),
            ),
            Container(
              // Job Description
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: new Form(
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      jobDescription = val;
                    });
                  },
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                      suffixIcon:
                          Icon(IconData(59047, fontFamily: 'MaterialIcons')),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Description"),
                ),
              ),
            ),
          ],
          //],
        )));
  }
}
