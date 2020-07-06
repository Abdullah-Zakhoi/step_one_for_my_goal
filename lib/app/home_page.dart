import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:steponeformygoal/services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({@required this.auth});
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
          actions: <Widget>[
            FlatButton(
              color: Colors.lime,
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onPressed: _signOut,
            ),
          ],
        ),
      ),
    );
  }
}
