import 'package:flutter/material.dart';
import 'package:day12_login/services/posts.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class Add extends StatefulWidget {
  Add({Key key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  String orgName;
  String orgContact = '';
  String State = '';
  String City = '';
  String Address = '';
  String jobTitle = '';
  String jobDescription = '';

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want leave the post?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new TextButton(
                onPressed: () => Navigator.pushNamed(context, '/'),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  final PostService _postService = PostService();
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

  final formkey1 = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Post here"),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
                textColor: Colors.white,
                onPressed: () async {
                  if (formkey1.currentState.validate()) {
                    _postService.savePost(orgName, orgContact, State, City,
                        Address, jobTitle, jobDescription);
                    Navigator.pop(context);
                  }
                },
                child: Text("Post your Job!!"))
          ],
        ),
        body: SingleChildScrollView(
            child: new Form(
                key: formkey1,
                child: Column(
                  children: [
                    Container(
                      // Organization Name
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      // child: new Form(

                      child: TextFormField(
                        validator: (value) => value.isEmpty
                            ? 'Organization name can\'t be empty'
                            : null,
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
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Organization Name/Group Name"),
                      ),
                      // )
                    ),
                    Container(
                      // Organization Contact Number
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      // child: new Form(
                      child: TextFormField(
                        validator: (value) => value.isEmpty
                            ? 'Contact Number can\'t be empty'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            orgContact = val;
                          });
                        },
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            suffixIcon: const Icon(
                                IconData(57608, fontFamily: 'MaterialIcons')),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Contact Number"),
                      ),
                      // ),
                    ),
                    Container(
                      // State
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      // child: new Form(
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'This field can\'t be empty' : null,
                        onChanged: (val) {
                          setState(() {
                            State = val;
                          });
                        },
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            suffixIcon: const Icon(
                                IconData(59453, fontFamily: 'MaterialIcons')),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "State"),
                      ),
                      // ),
                    ),
                    Container(
                      // City
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      // child: new Form(
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'This field can\'t be empty' : null,
                        onChanged: (val) {
                          setState(() {
                            City = val;
                          });
                        },
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            suffixIcon: const Icon(
                                IconData(59453, fontFamily: 'MaterialIcons')),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "City"),
                      ),
                      // ),
                    ),
                    Container(
                      // Address
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      // child: new Form(
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'This field can\'t be empty' : null,
                        onChanged: (val) {
                          setState(() {
                            Address = val;
                          });
                        },
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            suffixIcon: const Icon(
                                IconData(60190, fontFamily: 'MaterialIcons')),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Address"),
                      ),
                      // ),
                    ),
                    Container(
                      // Job Title
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      // child: new Form(
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'This field can\'t be empty' : null,
                        onChanged: (val) {
                          setState(() {
                            jobTitle = val;
                          });
                        },
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            suffixIcon: const Icon(
                                IconData(59047, fontFamily: 'MaterialIcons')),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Job Title"),
                      ),
                      // ),
                    ),
                    Container(
                      // Job Description
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      // child: new Form(
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'This field can\'t be empty' : null,
                        onChanged: (val) {
                          setState(() {
                            jobDescription = val;
                          });
                        },
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            suffixIcon: const Icon(
                                IconData(59047, fontFamily: 'MaterialIcons')),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Description"),
                      ),
                      // ),
                    ),
                  ],
                  //],
                ))),
      ),
    );
  }
}
