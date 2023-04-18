import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../static/themes.dart';
import '../widgets/conversation-appbar.dart';
import '../widgets/bubble-me.dart';
import '../widgets/bubble-you.dart';
import '../widgets/input.dart';

class ConversationPage extends StatefulWidget {
  final String theme;
  const ConversationPage({Key? key, required this.theme}) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.theme == "light" ? Themes.bodyLight : Themes.bodyDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Bar(
                theme: widget.theme,
              ),
              Container(
                height: 2,
                decoration: BoxDecoration(
                  color: widget.theme == "light"
                      ? Themes.dividerDark
                      : Themes.dividerLight,
                ),
              ),
              BubbleYou(),
              BubbleMe(),
            ],
          ),
          Column(
            children: [
              Input(),
            ],
          )
        ],
      ),
    );
  }
}
