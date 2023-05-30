import 'package:flutter/material.dart';
import 'package:chat_app/utility/database_helper.dart';
import 'package:mysql1/mysql1.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  MySqlConnection? connection;
  String mail = '';

  @override
  void initState() {
    super.initState();
    createDBWithData();
  }

  // Creates connection. And shows the users with the username 'PhoneEater'.
  void createDBWithData() {
    DatabaseHelper db = DatabaseHelper();

    db.createConnection().then((conn) {
      db.findUsersByUsername(conn!, 'PhoneEater');

      // Codes for inserting a user, then showing it with showUsers() method.
      // db.insertUser(conn!, 'Recep', 'PhoneEater', '05551114422', 'recep@gmail.com', 'HeyDon\'tTellAnyone').then((result) {
      //   db.showUsers(conn, result);
      // });
    });


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text(mail),
      ),
    );
  }
}
