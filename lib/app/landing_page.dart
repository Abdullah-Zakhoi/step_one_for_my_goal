import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:steponeformygoal/app/sign_in/sign_in_page.dart';
import 'package:steponeformygoal/services/auth.dart';

import 'home_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User>(
          stream: auth.onAuthStateChanged,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              User user = snapshot.data;
              if (user == null) {
//                print('>>>>>>>>>>>>>> null');
                return SignInPage(
                  auth: auth,
                );
              }
//              print('>>>>>>>>>>>>>> Ok');
              return HomePage(
                auth: auth,
              );
            } else {
//              print('>>>>>>>>>>>>>> no way');

              return Scaffold(
                body: Center(
                  child: Text(
                    'nooooooo',
                    style: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
