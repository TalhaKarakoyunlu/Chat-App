import 'package:chat_app/screens/add_contact_screen.dart';
import 'package:chat_app/utility/contact_data_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utility/user_data_notifier.dart';
import '../widgets/contact_widget.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var signedInUserData = context.watch<UserDataNotifier>().signedInUserData;
    var contacts = context.watch<ContactDataNotifier>().contacts;

    return Column(
      children: [
        TextButton(
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddContactScreen();
              }));
            },
            child: Text('Add a new contact.')),
        Expanded(
          child: ListView.builder(
            itemCount: contacts.length,
              itemBuilder: (context, int index) {
              return ContactWidget(contactCustomName: contacts[index].contactCustomName, contactPhoneNumber: contacts[index].contactPhoneNumber, imageURL: contacts[index].contactImageURL ?? "https://static.vecteezy.com/system/resources/thumbnails/002/534/006/small/social-media-chatting-online-blank-profile-picture-head-and-body-icon-people-standing-icon-grey-background-free-vector.jpg",);
          }),
        ),
      ],
    );
  }
}

