import 'package:chat_app/screens/conversation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utility/contact_data_notifier.dart';
import '../utility/user_data_notifier.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var signedInUserData = context.watch<UserDataNotifier>().signedInUserData;
    var contacts = context.watch<ContactDataNotifier>().contacts;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("MessagesPage"),
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
    );
  }
}
