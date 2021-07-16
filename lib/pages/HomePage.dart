import 'package:flutter/material.dart';
import 'package:flutter_web_app_todo/Service/Auth_Service.dart';
import 'package:flutter_web_app_todo/pages/SignUpPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await authClass.logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => SignUpPage()),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
