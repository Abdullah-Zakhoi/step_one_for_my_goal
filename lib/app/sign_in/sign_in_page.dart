import 'package:flutter/material.dart';
import 'package:steponeformygoal/app/landing_page.dart';
import 'package:steponeformygoal/services/auth.dart';
import 'email_sign_in_page.dart';
import 'sign_in_button.dart';
import 'social-sign-in-button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({@required this.auth});
  final AuthBase auth;
  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }

  void _signInWithEmail(BuildContext context) {
    // TODO:SHow email sign in page
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(
          auth: auth,
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('first step to my goal'),
        elevation: 10,
      ),
      body: _buildContainer(context),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 48),
          SocialSignInButton(
            imageName: 'images/g1.png',
            text: 'sign in with google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: _signInWithGoogle,
          ),
          SizedBox(height: 8),
          SocialSignInButton(
            imageName: "images/f3.jpg",
            text: 'sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height: 8),
          SignInButton(
            text: 'sign in with Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {
              _signInWithEmail(context);
            },
          ),
          SizedBox(height: 8),
          Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          SignInButton(
              text: 'go anonymous',
              textColor: Colors.black,
              color: Colors.lime[500],
              onPressed: () {
                print('this is good ++++>>>>>>');
                _signInAnonymously();
              }),
        ],
      ),
    );
  }
}
