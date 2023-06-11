import 'package:chat_app/models/models.dart';
import 'package:chat_app/theme.dart';
import 'package:chat_app/widgets/glowing_action_button.dart';
import 'package:chat_app/widgets/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/avatar.dart';

class ChatScreen extends StatelessWidget {
  static Route route(MessageData data) => MaterialPageRoute(
        builder: (context) => ChatScreen(
          messageData: data,
        ),
      );

  const ChatScreen({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: CupertinoIcons.back,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: _AppBarTitle(
          messageData: messageData,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.video_camera_solid,
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.phone_solid,
                onTap: () {},
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: _DemoMessageList(),
          ),
          _ActionBar(),
        ],
      ),
    );
  }
}

class _DemoMessageList extends StatelessWidget {
  const _DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: const [
          _DateLable(lable: "Yesterday"),
          _MessageTile(
            message: "Hi m8, hows it goin",
            messageDate: "15.35 PM",
          ),
          _MessageOwnTile(
            message: "Sup fam, is al good",
            messageDate: "15.35 PM",
          ),
          _MessageTile(
            message: "You picked the wrong house fool!",
            messageDate: "15.37 PM",
          ),
          _MessageOwnTile(
            message: "Ey, ey ey ey ey, big smoke! It's me! Carl, chill, chill!",
            messageDate: "15.37 PM",
          ),
          _MessageTile(
            message: "...CJ? OOOOHHH MY DOG, WASSUP HAHAHA",
            messageDate: "15.38 PM",
          ),
          _MessageTile(
            message:
                "MessageLimitTest test test test test test test test test test test zort test test test test test test test ",
            messageDate: "zortu zort geçe",
          ),
        ],
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({
    Key? key,
    required this.message,
    required this.messageDate,
  }) : super(key: key);

  final String message;
  final String messageDate;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 11,
              ),
              child: Text(
                messageDate,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
  const _MessageOwnTile({
    Key? key,
    required this.message,
    required this.messageDate,
  }) : super(key: key);

  final String message;
  final String messageDate;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                  bottomLeft: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 11,
              ),
              child: Text(
                messageDate,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DateLable extends StatelessWidget {
  const _DateLable({
    Key? key,
    required this.lable,
  }) : super(key: key);

  final String lable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Text(
              lable,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textFaded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(
          url: messageData.profilePicture,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageData.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 2),
              const Text(
                "Online",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                right:
                    BorderSide(width: 2, color: Theme.of(context).dividerColor),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                CupertinoIcons.camera_fill,
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: TextField(
                style: TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "Type something here",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 24, bottom: 10, top: 10),
            child: GlowingActionButton(
              color: AppColors.accent,
              icon: Icons.send_rounded,
              onPressed: () {
                print("TODO: send a message");
              },
            ),
          )
        ],
      ),
    );
  }
}
