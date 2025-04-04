import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/screens/login/widgets/fields/login_password_field.dart';
import 'package:flutter_base_project/ui/screens/login/widgets/fields/login_username_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({
    super.key,
    required this.username,
    required this.usernameChanged,
    required this.password,
    required this.passwordChanged,
    required this.onSubmitted,
  });

  final String username;
  final void Function(String) usernameChanged;

  final String password;
  final void Function(String) passwordChanged;
  final void Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginUsernameField(
          text: username,
          onTextChanged: usernameChanged,
        ),
        LoginPasswordField(
          text: password,
          onTextChanged: passwordChanged,
          onSubmitted: onSubmitted,
        )
      ],
    );
  }
}
