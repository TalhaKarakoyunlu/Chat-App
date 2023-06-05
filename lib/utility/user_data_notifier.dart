import 'package:chat_app/widgets/contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import '../models/user_data.dart';
import 'database_helper.dart';

class UserDataNotifier with ChangeNotifier {
  UserDataNotifier() : super();

  List<UserData> _allUserDatas = [];
  UserData? _signedInUserData;

  List<UserData> get allUserDatas => _allUserDatas;
  UserData? get signedInUserData => _signedInUserData;

  bool isEmail(String emailOrUsername) {
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (emailRegex.hasMatch(emailOrUsername)) {
      // Input matches the email format
      print('Input is an email');

      return true;
    } else {
      // Input is assumed to be a username
      print('Input is a username');

      return false;
    }
  }

  Future<void> createUserData(String name, String username, String phoneNumber, String email, String password, String? profilePictureURL) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    MySqlConnection? conn = await databaseHelper.createConnection();

    if (conn != null) {
      try {
        List<dynamic> results = [];
        Results allResults = await databaseHelper.insertUserAndShowUsers(conn, name, username, phoneNumber, email, password, profilePictureURL);

        results = allResults.toList();

        print(results.first);

        List<UserData> newData = results.map((row) => UserData(
          id: row[0],
          name: row[1],
          username: row[2],
          phoneNumber: row[3],
          email: row[4],
          password: row[5],
          profilePictureURL: row[6],
            last_update: row[7]
        )).toList();

        if (_allUserDatas.isEmpty) {
          _signedInUserData = newData.first; // Assign the first UserData object to _signedInUserData
          _allUserDatas.addAll(newData);
        }

        print('New data length: ' + newData.length.toString());
        print('All users: ' + _allUserDatas.toString());

        notifyListeners();
      } catch (e) {
        print('Error creating user data: $e');
      } finally {
        await databaseHelper.removeConnection(conn);
      }
    }
  }

  // This method is for finding a user and adding it to UserData model. You can use this to fetch a user with email or username.
  // {input} in the parameters is either email or username.
  Future<void> updateUserData(String input) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    MySqlConnection? conn = await databaseHelper.createConnection();

    if (conn != null) {
      try {
        List<dynamic> results = [];
        if (isEmail(input)) {
          // Input is email.
          Results emailResults = await databaseHelper.findUsersByEmail(conn, input);
          results = emailResults.toList();
        } else {
          // Input is username.
          Results usernameResults = await databaseHelper.findUsersByUsername(conn, input);
          results = usernameResults.toList();
        }

        List<UserData> newData = results.map((row) => UserData(
          id: row[0],
          name: row[1],
          username: row[2],
          phoneNumber: row[3],
          email: row[4],
          password: row[5],
          profilePictureURL: row[6],
            last_update: row[7]
        )).toList();

        if (_allUserDatas.isEmpty) {
          _signedInUserData = newData.first; // Assign the first UserData object to _signedInUserData
          _allUserDatas.addAll(newData); // Append newData to the existing list
        }


        print('New data length: ' + newData.length.toString());
        print('signed in user data ' + _signedInUserData.toString());
        print('All users: ' + _allUserDatas.toString());

        notifyListeners();
      } catch (e) {
        print('Error fetching user data: $e');
      } finally {
        await databaseHelper.removeConnection(conn);
      }
    }
  }

  Future<void> showUserDataWithPhoneNumber(String phoneNumber) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    MySqlConnection? conn = await databaseHelper.createConnection();

    if (conn != null) {
      try {

        List<dynamic> results = [];

        Results gotResults = await databaseHelper.findUsersByPhoneNumber(conn, phoneNumber);
        results = gotResults.toList();

        List<UserData> newData = results.map((row) => UserData(
          id: row[0],
          name: row[1],
          username: row[2],
          phoneNumber: row[3],
          email: row[4],
          password: row[5],
          profilePictureURL: row[6],
          last_update: row[7]
        )).toList();

        _allUserDatas.addAll(newData);

        print('New data phone Number: ' + newData[0].phoneNumber);

        notifyListeners();
      } catch (e) {
        print('Error fetching user data: $e');
      } finally {
        await databaseHelper.removeConnection(conn);
      }
    }
  }

  Future<void> addNewContact(String phoneNumber, String contactName) async {

    DatabaseHelper databaseHelper = DatabaseHelper();
    MySqlConnection? conn = await databaseHelper.createConnection();

    if (conn != null) {
      try {

        int user_id = _signedInUserData!.id;

        await databaseHelper.addContact(user_id, contactName, phoneNumber);

        print('New contact added.');


        notifyListeners();
      } catch (e) {
        print('Error fetching user data: $e');
      } finally {
        await databaseHelper.removeConnection(conn);
      }
    }

  }
}
