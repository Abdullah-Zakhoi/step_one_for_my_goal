import 'package:flutter/material.dart';
import 'package:steponeformygoal/common_widget/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String imageName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                imageName,
                width: 40,
                height: 40,
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: Image.asset(imageName),
              ),
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
