import 'package:flutter/material.dart';
import 'package:steponeformygoal/common_widget/form_submit_button.dart';
import 'package:steponeformygoal/services/auth.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({@required this.auth});
  final AuthBase auth;
  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  bool checkUpdate = false;
  bool checkToEnableButton = true;

  String emailUpdate = '';
  String passwordUpdate = '';

  bool isBeforeClickOnButton = true;

  void _emailEditingComplete() {
    final newFocus = emailUpdate.isEmpty ? _emailFocusNode : _passwordFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _submit() async {
    setState(() {
      isBeforeClickOnButton = false;
    });
    checkToEnableButton = false;
    try {
      await Future.delayed(Duration(seconds: 3));
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      } else {
        print('(*&^%*&^%#*&^%*&^%)');
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
        print('(*&^%*&^%#*&^%*&^%)');
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        checkToEnableButton = true;
      });
    }
  }

  void _toggleFormType() {
    setState(() {
      isBeforeClickOnButton = true;
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
      _emailController.clear();
      _passwordController.clear();
    });
  }

  List<Widget> _buildChildren() {
    setState(() {
      if (emailUpdate.isNotEmpty && passwordUpdate.isNotEmpty) {
        checkUpdate = true;
      } else {
        checkUpdate = false;
      }
    });
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
    return [
      TextField(
        autofocus: true,
        controller: _emailController,
        focusNode: _emailFocusNode,
        onEditingComplete: _emailEditingComplete,
        onChanged: (email) => updateChangeEmail(email),
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'email@gmail.com',
          errorText: errorTextCases(),
        ),
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        controller: _passwordController,
        focusNode: _passwordFocusNode,
        onEditingComplete: _submit,
        onChanged: (password) => updateChangePassword(password),
        decoration: InputDecoration(
          labelText: 'Password',
//          errorText: passwordUpdate.isNotEmpty && isBeforeClickOnButton
//              ? 'you should enter your password'
//              : null,
        ),
        obscureText: true,
        textInputAction: TextInputAction.done,
      ),
      SizedBox(
        height: 8,
      ),
      FormSubmitButton(
        onPressed: checkUpdate && checkToEnableButton ? _submit : null,
        text: primaryText,
      ),
      SizedBox(
        height: 8,
      ),
      FlatButton(
        child: Text(secondaryText),
        onPressed: _toggleFormType,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: _buildChildren(),
        ),
      ),
    );
  }

  String errorTextCases() {
    if (isBeforeClickOnButton) {
      print('isBeforeClickOnButton');
      return null;
    } else if (emailUpdate.isNotEmpty) {
      print('emailUpdate is Not Empty');
      return null;
    } else {
      print('emailUpdate is Empty');
      return 'you should enter your email';
    }
  }

  void updateChangeEmail(email) {
    setState(() {
      emailUpdate = email;
    });
  }

  void updateChangePassword(password) {
    setState(() {
      passwordUpdate = password;
    });
  }
}
