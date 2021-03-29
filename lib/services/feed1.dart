import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day12_login/screens/home/items.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class LoadDataFromFirestore extends StatefulWidget {
  @override
  _LoadDataFromFirestoreState createState() => _LoadDataFromFirestoreState();
}

class _LoadDataFromFirestoreState extends State<LoadDataFromFirestore> {
  QuerySnapshot querySnapshot;

  @override
  void initState() {
    super.initState();
    getDriversList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }

  Future<Null> _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() async {
      await FirebaseFirestore.instance
          .collection('Posts')
          .orderBy('Posted On', descending: true)
          .get();
    });
  }

  var index = 0;
  String colourGiver() {
    var colours = [
      // "0xffd81860",
      "0xffffa830",
      "0xffDEDCE4",
      "0xffff6048",
      "0xff8FA2A6",
      "0xffF9968B",
      // "0xffAAD9CD",
      "0xff2CCED2",
      // "0xffFEC7BC",
      "0xffB8A390",
      "0xff30a8a8",
      "0xffF5BFD2",
      "0xff82B2B8",
    ];
    if (index >= 9) {
      index = 0;
    } else {
      index++;
    }
    return colours[index];
  }

  Widget _showDrivers() {
    //check if querysnapshot is null
    if (querySnapshot != null) {
      return RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView.builder(
            primary: false,
            itemCount: querySnapshot.docs.length,
            padding: EdgeInsets.all(0),
            itemBuilder: (context, i) {
              return Column(
                children: [
                  items(),
                  InkWell(
                      child: Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                width: 500,
                                child: Card(
                                    color: Color(int.parse(colourGiver())),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white70, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    borderOnForeground: true,
                                    margin: EdgeInsets.all(10),
                                    elevation: 10,
                                    shadowColor: Colors.black,
                                    child: InkWell(
                                      splashColor: Colors.blue.withAlpha(30),
                                      onTap: () {
                                        print("yo");
                                      },
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                          ),
                                          IntrinsicHeight(
                                            child: Stack(
                                              children: [
                                                Align(
                                                  child: Text(
                                                    "${querySnapshot.docs[i].data()['Organization Name']} \n",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Positioned(
                                                    right: 0,
                                                    child: MaterialButton(
                                                      child: Icon(Icons.share),
                                                      onPressed: () {
                                                        Share.share(
                                                            "${querySnapshot.docs[i].data()['Job Title']} \n Contact: ${querySnapshot.docs[i].data()['Organization Contact']} \n${querySnapshot.docs[i].data()['Job Description']}");
                                                      },
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 20,
                                                  left: 10,
                                                  right: 10),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${querySnapshot.docs[i].data()['Job Title']}",
                                                      // textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Contact: ${querySnapshot.docs[i].data()['Organization Contact']}",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      "State: ${querySnapshot.docs[i].data()['State']} ",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      "City: ${querySnapshot.docs[i].data()['City']} ",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Address: ${querySnapshot.docs[i].data()['Address']}",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Description: ${querySnapshot.docs[i].data()['Job Description']}",
                                                      // textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          // Padding(
                                          //   padding: EdgeInsets.only(bottom: 5),
                                          //   child: Container(
                                          //       child: FlatButton(
                                          //           textColor: Colors.black,
                                          //           child:
                                          //               Text("Show Interest"))),
                                          // )
                                        ],
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              );
            },
          ));
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  // void share(BuildContext context) {
  //   final RenderBox box = context.findRenderObject();
  //   final String text = "Welcome";
  //   Share.share(text,
  //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  // }

  //get firestore instance
  getDriversList() async {
    return await FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('Posted On', descending: true)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showDrivers(),
    );
  }
}
