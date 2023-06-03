import 'package:chat_app/screens/conversation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("MessagesPage"),
          TextButton(onPressed: () {
            Navigator.of(context).pushNamed("/conversation");
          }, child: Text("Go to Convarsation Page"))
        ],
      ),
    );
  }
}
