import 'package:flutter/material.dart';

import 'avatar.dart';

const contactsTextStyle = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w600,
    fontSize: 20
);

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    Key? key,
    required this.imageURL,
    required this.contactCustomName,
    required this.contactPhoneNumber
  }) : super(key: key);

  final String imageURL;
  final String contactCustomName;
  final String contactPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Avatar.small(
            url:
            imageURL,
          ),
          Column(
            children: [
              Text(contactCustomName, style: contactsTextStyle,),
              Text(contactPhoneNumber, style: contactsTextStyle,)
            ],
          ),
          IconButton(
              onPressed: () {
                //TODO: Implement calling.
              },
              icon: Icon(Icons.call, size: 20, color: Colors.black54,)),
        ],
      ),
    );
  }
}
