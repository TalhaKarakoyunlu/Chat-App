import 'package:chat_app/widgets/avatar.dart';
import 'package:chat_app/widgets/contact_widget_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const contactNameTextStyle = TextStyle(
  fontSize: 30,
  color: Colors.blue,
  fontWeight: FontWeight.bold
);

const contactUserNameTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 15.0
);

class ContactDetailsScreen extends StatelessWidget {
  const ContactDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Avatar(radius: 100, url: 'https://picsum.photos/200',),
                SizedBox(height: 20.0,),
                Text('Contact Name', style: contactNameTextStyle,),
                SizedBox(height: 20.0,),
                Text('@User Username', style: contactUserNameTextStyle,),
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
                leading: Icon(Icons.email),
                title: Text('example@gmail.com'),
                subtitle: Text('Email'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('05551112233'),
                subtitle: Text('Phone Number'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

