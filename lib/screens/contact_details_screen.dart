import 'package:chat_app/theme.dart';
import 'package:chat_app/widgets/avatar.dart';
import 'package:chat_app/widgets/contact_widget_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/icon_buttons.dart';

const contactNameTextStyle =
    TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold);

const contactUserNameTextStyle = TextStyle(color: Colors.black, fontSize: 15.0);

class ContactDetailsScreen extends StatelessWidget {
  const ContactDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        actionsIconTheme: Theme.of(context).iconTheme,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: CupertinoIcons.back,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Center(
              child: IconBorder(
                icon: Icons.edit,
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: IconBorder(
                icon: Icons.more_vert,
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Avatar(
                    radius: 100,
                    url: 'https://picsum.photos/200',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Contact Name',
                    style: contactNameTextStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '@User Username',
                    style: contactUserNameTextStyle,
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.secondary,
              thickness: 3.0,
              indent: 15.0,
              endIndent: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContactWidgetButton(
                      buttonIcon: Icon(Icons.call),
                      buttonName: 'Call',
                      buttonAction: () {}),
                  ContactWidgetButton(
                      buttonIcon: Icon(Icons.message),
                      buttonName: 'Message',
                      buttonAction: () {}),
                  ContactWidgetButton(
                      buttonIcon: Icon(Icons.email),
                      buttonName: 'Email',
                      buttonAction: () {}),
                ],
              ),
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.0,
                    bottom: 10,
                  ),
                  child: Text(
                    "More User Information",
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
      ),
    );
  }
}
