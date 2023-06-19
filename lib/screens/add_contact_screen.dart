import 'package:chat_app/utility/contact_data_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utility/user_data_notifier.dart';
import '../widgets/icon_buttons.dart';

class AddContactScreen extends StatelessWidget {
  AddContactScreen({super.key});

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();

  String contactName = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    var signedInUser = context.watch<UserDataNotifier>().signedInUserData;

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
      ),
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
                decoration:
                    InputDecoration(label: Text('Enter contact phone number.')),
                textInputAction: TextInputAction.next,
              ),
              TextButton(
                onPressed: () async {
                  //TODO: Implement adding new contact.

                  phoneNumber = phoneNumberController.text;
                  contactName = contactNameController.text;

                  print("SIGNED IN USER NAME " + signedInUser!.name);

                  await context.read<ContactDataNotifier>().addNewContact(
                      signedInUser, phoneNumber, contactName);

                  // THIS RELOADS ALL CONTACTS FROM SCRATCH AND CAUSES TOO MUCH TIME LOSS
                  // await context
                  //     .read<ContactDataNotifier>()
                  //     .loadContacts(signedInUser.id);

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
