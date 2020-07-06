import 'package:flutter/material.dart';
import 'package:steponeformygoal/app/landing_page.dart';

import 'services/auth.dart';

void main() {
  runApp(FirstStepToMyGoal());
}

class FirstStepToMyGoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
