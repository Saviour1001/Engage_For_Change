import 'package:flutter_chat/chatData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/chatWidget.dart';

class Chat extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  void initState() {
    super.initState();
    ChatData.init("Just Chat", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ChatWidget.getAppBar(),
        backgroundColor: Colors.white,
        body: ChatWidget.widgetWelcomeScreen(context));
  }
}
