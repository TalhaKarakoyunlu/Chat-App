import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/signup_screen.dart';
import 'package:chat_app/utility/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  DatabaseHelper db = DatabaseHelper();

  TextEditingController emailOrUsernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailOrUsername = '';
  String password = '';

  // Checks if the given String is an email or a username.
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

  @override
  Widget build(BuildContext context) {
    // TODO: Improve the UI design.

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailOrUsernameController,
                decoration: InputDecoration(
                  labelText: 'Email or Username',
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  emailOrUsername = value;
                },
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                autocorrect: false,
                decoration: InputDecoration(
                    label: Text('Password')
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
              TextButton(
                child: Text('SIGN IN'),
                onPressed: () {
                  if (emailOrUsernameController.text.isNotEmpty) {
                    if (passwordController.text.isNotEmpty) {
                      if (passwordController.text.length > 5) {
                        dynamic users;

                        if (isEmail(emailOrUsername)) {
                          db.createConnection().then((conn) async {
                            // value is an email.
                            users = await db.findUsersByEmail(conn!, emailOrUsername);

                            for (var row in users) {
                              var email = row[4];
                              var DBpassword = row[5];

                              print(emailOrUsername);
                              print(email);
                              print(DBpassword);
                              print(password);


                              if (emailOrUsername == email && password == DBpassword) {
                                print('Email is correct. Signing in...' + row[2]);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                              } else {
                                print('Wrong email. Try again');
                              }
                            }
                          });
                        } else {
                          db.createConnection().then((conn) async {
                            // value is a username.
                            users = await db.findUsersByUsername(conn!, emailOrUsername);

                            for (var row in users) {
                              var username = row[2];
                              var DBpassword = row[5];

                              if (username == emailOrUsername  && DBpassword == password) {
                                print('Username is correct. Signing in...' + username);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                              } else {
                                print('Wrong username. Try again');
                              }
                            }
                          });
                        }
                      }
                    }
                  }
                },
              ),
              Row(
                children: [
                  Text('Not have account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return SignupScreen();
                        }));
                      },
                      child: Text('Sign up'))
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
                child: Text('Go to Main Screen'),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
