import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff007580),
        title: Text("About Us"),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/about_images/pic1.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
                "We have made this platform in order to uplift the community as a whole. The purpose is to promote social work and create more oppurtunites for people to do social work which will lead to betterment of the society."),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Made with 💙 by "),
          ),
          Center(
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      // radius: 10,
                      backgroundImage: AssetImage('assets/about_images/me.png'),
                    ),
                    title: Text(
                      "Avish Mehta",
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      // radius: 10,
                      backgroundImage:
                          AssetImage('assets/about_images/Ankit.jpeg'),
                    ),
                    title: Text(
                      "Ankit Agarwal",
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      // radius: 10,
                      backgroundImage:
                          AssetImage('assets/about_images/Harsh.png'),
                    ),
                    title: Text(
                      "Harsh Ghodkar",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
