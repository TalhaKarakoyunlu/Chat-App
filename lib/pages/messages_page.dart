import 'package:chat_app/screens/conversation.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../helpers.dart';
import '../models/message_data.dart';
import '../models/story_data.dart';
import '../screens/chat_screen.dart';
import '../theme.dart';
import '../widgets/avatar.dart';
import 'package:provider/provider.dart';

import '../utility/contact_data_notifier.dart';
import '../utility/user_data_notifier.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _Stories(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(_delegate),
        )
      ],
    );

    /*return Center(

    var signedInUserData = context.watch<UserDataNotifier>().signedInUserData;
    var contacts = context.watch<ContactDataNotifier>().contacts;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("MessagesPage"),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/conversation");
              },
              child: Text("Go to Convarsation Page"))
          TextButton(onPressed: () {
            Navigator.of(context).pushNamed("/conversation");
          }, child: Text("Go to Convarsation Page")),
          TextButton(
              onPressed: () async {
                await context.read<ContactDataNotifier>().loadContacts(signedInUserData!.id);

                for (var contact in contacts) {
                  print(contact.contactCustomName);
                }
              },
              child: Text('Get Contacts'),
          )
        ],
      ),
    ); */
  }

  Widget _delegate(BuildContext context, int index) {
    final Faker faker = Faker();
    final date = Helpers.randomDate();
    final jiffy = Jiffy(date).fromNow();
    return _MessageTitle(
        messageData: MessageData(
            senderName: faker.person.name(),
            message: faker.lorem.sentence(),
            dateMessage: Jiffy(date).fromNow(),
            profilePicture: Helpers.randomPictureUrl(),
            messageDate: date));
  }
}

class _MessageTitle extends StatelessWidget {
  const _MessageTitle({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Navigator.of(context).pushNamed('/conversation');
        Navigator.of(context).push(ChatScreen.route(messageData));
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Avatar.medium(
                  url: messageData.profilePicture,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        messageData.senderName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          letterSpacing: 0.3,
                          wordSpacing: 1.7,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                      child: Text(
                        messageData.message,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.textFaded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      messageData.dateMessage.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 12,
                        letterSpacing: -0.1,
                        color: AppColors.textFaded,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontSize: 11, color: AppColors.textLight),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: Text(
                "Stories",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: AppColors.textDark,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  var faker = new Faker();
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 60,
                      child: _StoryCard(
                        storyData: StoryData(
                          name: faker.person.name(),
                          url: Helpers.randomPictureUrl(),
                          //"https://talhakarakoyunlu.github.io/cv/images/talha%20profile%20picture.png",
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
