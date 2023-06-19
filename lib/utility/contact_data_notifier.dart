import 'package:chat_app/utility/user_data_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:mysql1/mysql1.dart';
import 'package:provider/provider.dart';
import '../models/contact_data.dart';
import '../models/user_data.dart';
import 'database_helper.dart';
import 'secrets.dart';

class ContactDataNotifier with ChangeNotifier {
  List<ContactData> _contacts = [];
  ContactData? _currentContactData;

  List<ContactData> get contacts => _contacts;
  ContactData? get currentContactData => _currentContactData;
  UserDataNotifier userDataNotifier = UserDataNotifier();
  DatabaseHelper _databaseHelper = DatabaseHelper();

  //TODO: Make this method work better. It takes too long to run. DONE✅
  Future<void> addNewContact(
      String signedInUsername, String phoneNumber, String contactName) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    MySqlConnection? conn = await databaseHelper.createConnection();

    if (conn != null) {
      try {
        await userDataNotifier.signInUser(signedInUsername);

        if (userDataNotifier.signedInUserData != null) {
          int userId = userDataNotifier.signedInUserData!.id;

          Results? newContact = await databaseHelper.addContact(userId, contactName, phoneNumber);

          late Results newContactUserResults;
          late UserData newContactUserData;
          late ContactData contact;

          for (var row in newContact!) {
            newContactUserResults = await _databaseHelper.findUsersById(row[2]);
          }

          for (var row in newContactUserResults) {
            newContactUserData = UserData(
              id: row[0],
              name: row[1],
              username: row[2],
              phoneNumber: row[3],
              email: row[4],
              password: row[5],
              profilePictureURL: row[6],
              registration_date: row[7],
              last_update: row[8],
            );
          }

          for (var row in newContact) {
            contact = ContactData(
              id: row[0],
              userId: row[1],
              contactUserId: row[2],
              contactCustomName: row[3],
              contactUser: newContactUserData,
            );
          }

          _contacts.add(contact);

          // THIS LINE USED TO TAKE 5 EXTRA SECONDS!
          // Results results = await databaseHelper.showContacts(userId);

          // if (results.isNotEmpty) {
          //   List<ContactData> newData = results.map((row) => ContactData(
          //     id: row[0],
          //     userId: row[1],
          //     contactUserId: row[2],
          //     contactCustomName: row[3],
          //   )).toList();
          //
          //   _contacts.addAll(newData);
          //
          //   print('New contact added. Contact name is ' + contacts.first.contactCustomName);
          // }
        } else {
          print('Signed in user data is null.');
        }

        notifyListeners();
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }
  }

  Future<void> loadContacts(int? userId) async {
    try {
      List<ContactData> contacts = [];
      Results rows = await _databaseHelper.showContacts(userId!);

      Map<int, UserData> contactUsers = {};

      for (var row in rows) {
        Results contactRows = await _databaseHelper.findUsersById(row[2]);
        for (var contactRow in contactRows) {
          UserData contactUser = UserData(
            id: contactRow[0],
            name: contactRow[1],
            username: contactRow[2],
            phoneNumber: contactRow[3],
            email: contactRow[4],
            password: contactRow[5],
            profilePictureURL: contactRow[6],
            registration_date: contactRow[7],
            last_update: contactRow[8],
          );
          contactUsers[contactUser.id] = contactUser;
        }
      }

      for (var row in rows) {
        UserData? contactUser = contactUsers[row[2]];
        if (contactUser != null) {
          ContactData contact = ContactData(
            id: row[0],
            userId: row[1],
            contactUserId: row[2],
            contactCustomName: row[3],
            contactUser: contactUser,
          );
          contacts.add(contact);
        }
      }

      _contacts = contacts;
      notifyListeners();
    } catch (e) {
      print('Error loading contacts: $e');
      // Handle the error appropriately (e.g., log the error, display an error message).
    }
  }



  ContactData? findContactByID(int contactID) {
    for (ContactData contact in _contacts) {
      if (contact.id == contactID) {
        // Replace "getID()" with your actual ID property
        return contact;
      }
    }
    return null;
  }

  ContactData? findContactByUsername(String contactUsername) {
    for (ContactData contact in _contacts) {
      if (contact.contactUser!.username == contactUsername) {
        // Replace "getID()" with your actual ID property
        return contact;
      }
    }
    return null;
  }

  ContactData? findContactByPhoneNumber(String phoneNumber) {
    for (ContactData contact in _contacts) {
      if (contact.contactUser!.phoneNumber == phoneNumber) {
        // Replace "getID()" with your actual ID property
        return contact;
      }
    }
    return null;
  }

  Future<void> updateContactName(
      ContactData contact, String newContactName) async {
    try {
      // Update the contact's name
      contact.contactUser!.name = newContactName;

      // Update the contact's name in the database
      await _databaseHelper.updateContactName(
        contact.userId,
        contact.contactUser!.phoneNumber,
        newContactName,
      );

      // Update the contact data in the notifier
      _currentContactData = contact;

      notifyListeners();
    } catch (e) {
      print('Error updating contact name: $e');
      // Handle the error appropriately (e.g., log the error, display an error message).
    }
  }
}
