import 'package:chat_app/utility/contact_data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utility/user_data_notifier.dart';

class AddContactScreen extends StatelessWidget {
  AddContactScreen({super.key});

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();

  String contactName = '';
  String phoneNumber = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: contactNameController,
                decoration: InputDecoration(
                  labelText: 'Enter the contact name',
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: phoneNumberController,
                autocorrect: false,
                decoration: InputDecoration(
                    label: Text('Enter contact phone number.')
                ),
                textInputAction: TextInputAction.next,
              ),
              TextButton(
                onPressed: () async {
                  //TODO: Implement adding new contact.

                  phoneNumber = phoneNumberController.text;
                  contactName = contactNameController.text;

                  var contactDataNotifier = Provider.of<ContactDataNotifier>(context, listen: false);
                  await contactDataNotifier.addNewContact('Reco546', phoneNumber, contactName);

                  Navigator.pop(context);
                },
                child: Text('Add new Contact'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
