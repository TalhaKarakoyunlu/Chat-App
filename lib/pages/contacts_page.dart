import 'package:chat_app/screens/add_contact_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/contact_widget.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddContactScreen();
              }));
            },
            child: Text('Add a new contact.')),
        Expanded(
          child: ListView.builder(
            itemCount: 30,
              itemBuilder: (context, int index) {
              return ContactWidget(contactCustomName: 'Recep Börekci', contactPhoneNumber: '05552223344', imageURL: "https://talhakarakoyunlu.github.io/cv/images/talha%20profile%20picture.png",);
          }),
        ),
      ],
    );
  }
}

