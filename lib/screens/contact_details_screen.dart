import 'package:chat_app/models/contact_data.dart';
import 'package:chat_app/utility/contact_data_notifier.dart';
import 'package:chat_app/widgets/avatar.dart';
import 'package:chat_app/widgets/contact_widget_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const contactCustomNameTextStyle = TextStyle(
  fontSize: 30,
  color: Colors.blue,
  fontWeight: FontWeight.bold
);

const contactNameTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 15.0
);

class ContactDetailsScreen extends StatelessWidget {

  const ContactDetailsScreen({required this.contactName, required this.contactPhoneNumber});

  final String contactName;
  final String contactPhoneNumber;

  @override
  Widget build(BuildContext context) {

    ContactData? contact = context.read<ContactDataNotifier>().findContactByPhoneNumber(contactPhoneNumber);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: () {}, child: Text('Get User Information')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Avatar(radius: 100, url: 'https://picsum.photos/200',),
                SizedBox(height: 20.0,),
                Text(contactName, style: contactCustomNameTextStyle,),
                SizedBox(height: 20.0,),
                Text(contact!.contactName, style: contactNameTextStyle,),
              ],
            ),
          ),
          Divider(
            color: Colors.lightBlue,
            thickness: 3.0,
            indent: 15.0,
            endIndent: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactWidgetButton(buttonIcon: Icon(Icons.call), buttonName: 'Call', buttonAction: () {}),
              ContactWidgetButton(buttonIcon: Icon(Icons.message), buttonName: 'Message', buttonAction: () {}),
              ContactWidgetButton(buttonIcon: Icon(Icons.email), buttonName: 'Email', buttonAction: () {}),
            ],
          ),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text(contact.contactUsername),
                subtitle: Text('Username'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(contact.contactEmail),
                subtitle: Text('Email'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(contact.contactPhoneNumber),
                subtitle: Text('Phone Number'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

