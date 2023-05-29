import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utility/database_helper.dart';
import 'screens/conversation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var theme = "light";
  var db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {

    db.printVersion();

    db.addUsersTable();

    db.insertUser(0, 'Recep', 'TheBestAnswerer', '01234567891', 'testing@gmail.com', 'password');

    db.selectUsersByUsername('TheBestAnswerer');

    db.disposeTheDB();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      ////////////////////////////////////////////// USE THESE FOR NAVIGATING ///////////////////////////////////////////////////


      routes: {
        "/conversation": (context) => ConversationPage(
              theme: "light",
            ),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/conversation"),
          child: Text("Tap Me!"),
        ),
      ),
    );
  }
}
