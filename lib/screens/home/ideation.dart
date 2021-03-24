import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:day12_login/screens/main/home.dart';
import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.3,
                1
              ],
              colors: [
                Color(0xffff4000),
                Color(0xffffcc66),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/ideation_images/1.png',
              height: screenSize.height * (0.9),
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.3,
                1
              ],
              colors: [
                Color(0xffff4000),
                Color(0xffffcc66),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/ideation_images/2.png',
              height: screenSize.height * (0.9),
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.3,
                1
              ],
              colors: [
                Color(0xffff4000),
                Color(0xffffcc66),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/ideation_images/3.png',
              height: screenSize.height * (0.9),
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.3,
                1
              ],
              colors: [
                Color(0xffff4000),
                Color(0xffffcc66),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/explainer/1.png',
              height: screenSize.height * (0.9),
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

class Item5 extends StatelessWidget {
  const Item5({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.3,
                1
              ],
              colors: [
                Color(0xffff4000),
                Color(0xffffcc66),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/explainer/2.png',
              height: screenSize.height * (0.9),
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

class Item6 extends StatelessWidget {
  const Item6({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.3,
                1
              ],
              colors: [
                Color(0xffff4000),
                Color(0xffffcc66),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/explainer/3.png',
              height: screenSize.height * (0.9),
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

class idea extends StatefulWidget {
  @override
  _ideaState createState() => _ideaState();
}

class _ideaState extends State<idea> {
  int _currentIndex = 0;

  List cardList = [
    Item1(),
    Item2(),
    Item3(),
    Item4(),
    Item5(),
    Item6(),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  // void setState(index) {
  //   _currentIndex = index;
  // }

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
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff007580),
      //   title: Text("Tutorial"),
      // ),
      body: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: screenSize.height * (0.9),
              autoPlay: true,
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              autoPlayInterval: Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: cardList.map((card) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.blueAccent,
                      child: card,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                "Skip Tutorial ",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: screenSize.height * (0.04),
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
