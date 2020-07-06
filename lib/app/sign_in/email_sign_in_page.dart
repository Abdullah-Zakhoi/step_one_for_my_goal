import 'package:flutter/material.dart';
import 'package:steponeformygoal/services/auth.dart';

import 'email_sign_in_form.dart';

class EmailSignInPage extends StatefulWidget {
  EmailSignInPage({@required this.auth});
  final AuthBase auth;
  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('sign in'),
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
            child: EmailSignInForm(
          auth: widget.auth,
        )),
      ),
    );
  }
}
