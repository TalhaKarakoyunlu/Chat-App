import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  String email = '';
  String username = '';
  String password = '';
  String retypePassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                    label: Text('Email')
                ),
              ),
              TextField(
                controller: usernameController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration: InputDecoration(
                    label: Text('Username')
                ),
              ),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                autocorrect: false,
                decoration: InputDecoration(
                    label: Text('Password')
                ),
              ),
              TextField(
                controller: retypePasswordController,
                keyboardType: TextInputType.visiblePassword,
                autocorrect: false,
                decoration: InputDecoration(
                    label: Text('Retype Password')
                ),
              ),
              TextButton(
                onPressed: () {
                  if(email.isNotEmpty && username.isNotEmpty && password.isNotEmpty && retypePassword.isNotEmpty) {
                    email = emailController.text;
                    username = usernameController.text;
                    password = passwordController.text;
                    retypePassword = retypePasswordController.text;

                    if (password == retypePassword) {
                      // TODO Add authentication here
                    }

                  }
              },
                child: Text('SIGN UP'),
              ),
              Row(
                children: [
                  Text('Already have account?'),
                  TextButton(
                      onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  },
                      child: Text('Log in'))
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
