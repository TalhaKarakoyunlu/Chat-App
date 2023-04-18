import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/conversation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var theme = "light";

  @override
  Widget build(BuildContext context) {
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
