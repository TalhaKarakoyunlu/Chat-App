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

    createDBWithData();

    super.initState();
  }

  void createDBWithData() async {
    DatabaseHelper db = DatabaseHelper();
    db.insertUser('Recep', 'PhoneEater', '05551114422', 'recep@gmail.com', 'HeyDon\'tTellAnyone');
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
