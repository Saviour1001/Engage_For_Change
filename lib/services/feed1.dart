import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day12_login/screens/home/items.dart';
import 'package:flutter/material.dart';

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
      "0xff845ec2",
      "0xffffe227",
      "0xff64dfdf",
      "0xfff58634",
      "0xffff577f",
      "0xffff4646",
      "0xfff9f871",
    ];
    if (index >= 6) {
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
            padding: EdgeInsets.all(20),
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
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Org Name:  ${querySnapshot.docs[i].data()['Organization Name']}",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Contact: ${querySnapshot.docs[i].data()['Organization Contact']}",
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "State: ${querySnapshot.docs[i].data()['State']} ",
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "City: ${querySnapshot.docs[i].data()['City']} ",
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Address: ${querySnapshot.docs[i].data()['Address']}",
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${querySnapshot.docs[i].data()['Job Title']}",
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Description: ${querySnapshot.docs[i].data()['Job Description']}",
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          )
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
