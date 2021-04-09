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

  bool _p1 = false;
  bool _p2 = false;
  bool _p3 = false;
  bool _p4 = false;
  bool _p5 = false;
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
      // "0xffDEDCE4",
      // "0xffff6048",
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
    if (index >= 7) {
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
              // bool k = querySnapshot.docs[i].data()['arr[0]'];
              // if(k==true)
              // {
              //   continue;
              // }
              // print(k);
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
        // .where('ed', isEqualTo: true)
        // .orderBy('Posted On', descending: true)
        // .where('arr[0]', isEqualTo: _p1 )
        // .where('arr[0]', isEqualTo: true)
        .get();
  }

  getDriversListAsPerChoice(String st) async {
    return await FirebaseFirestore.instance
        .collection('Posts')
        .where('${st}', isEqualTo: true)
        // .orderBy('Posted On', descending: true)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 0.0),
                  height: 40.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          child: new Text('Education'),
                          textColor: Colors.black,

                          color: _p1 ? Colors.blueGrey[100] : Colors.blue[100],
                          // 3
                          onPressed: () => {
                            setState(() {
                              _p1 = !_p1;
                              _p2 = false;
                              _p3 = false;
                              _p4 = false;
                              _p5 = false;
                              print('yo');
                              if (_p1 == true) {
                                getDriversListAsPerChoice("ed").then((results) {
                                  setState(() {
                                    querySnapshot = results;
                                  });
                                });
                              } else {
                                getDriversList().then((results) {
                                  setState(() {
                                    querySnapshot = results;
                                  });
                                });
                              }

                              // getDriversListAsPerChoice();
                            })
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          child: new Text('Counselling'),
                          textColor: Colors.black,

                          color: _p2 ? Colors.blueGrey[100] : Colors.blue[100],
                          // 3
                          onPressed: () => {
                            setState(() {
                              _p2 = !_p2;
                              _p1 = false;
                              _p3 = false;
                              _p4 = false;
                              _p5 = false;
                              if (_p2 == true) {
                                getDriversListAsPerChoice("co").then((results) {
                                  setState(() {
                                    querySnapshot = results;
                                  });
                                });
                              } else {
                                getDriversList().then((results) {
                                  setState(() {
                                    querySnapshot = results;
                                  });
                                });
                              }
                              // getDriversList(1);
                            })
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          child: new Text('Health Care'),
                          textColor: Colors.black,

                          color: _p3 ? Colors.blueGrey[100] : Colors.blue[100],
                          // 3
                          onPressed: () => {
                            setState(() {
                              _p3 = !_p3;
                              _p2 = false;
                              _p1 = false;
                              _p4 = false;
                              _p5 = false;
                              if (_p3 == true) {
                                getDriversListAsPerChoice("hc").then((results) {
                                  setState(() {
                                    querySnapshot = results;
                                  });
                                });
                              } else {
                                getDriversList().then((results) {
                                  setState(() {
                                    querySnapshot = results;
                                  });
                                });
                              }
                              // getDriversList(2);
                            })
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          child: new Text('Youth Work'),
                          textColor: Colors.black,

                          color: _p4 ? Colors.blueGrey[100] : Colors.blue[100],
                          // 3
                          onPressed: () => {
                            setState(() {
                              _p4 = !_p4;
                              _p3 = false;
                              _p2 = false;
                              _p1 = false;
                              _p5 = false;
                              if (_p4 == true) {
                                getDriversListAsPerChoice("yw").then((results) {
                                  setState(() {
                                    querySnapshot = results;
                                  });
                                });
                              } else {
                                getDriversList().then((results) {
                                  setState(() {
                                    querySnapshot = results;
                                  });
                                });
                              }

                              // getDriversList(4);
                            })
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          child: new Text('Administration'),
                          textColor: Colors.black,

                          color: _p5 ? Colors.blueGrey[100] : Colors.blue[100],
                          // 3
                          onPressed: () => {
                            setState(() {
                              _p5 = !_p5;
                              _p3 = false;
                              _p2 = false;
                              _p1 = false;
                              _p4 = false;
                              if (_p5 == true) {
                                getDriversListAsPerChoice("ad").then((results) {
                                  setState(() {
                                    querySnapshot = results;
                                  });
                                });
                              } else {
                                getDriversList().then((results) {
                                  setState(() {
                                    querySnapshot = results;
                                  });
                                });
                              }
                              // getDriversList(4);
                            })
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //
                Container(
                  height: 630,
                  child: _showDrivers(),
                )
              ],
            )));
  }
}
