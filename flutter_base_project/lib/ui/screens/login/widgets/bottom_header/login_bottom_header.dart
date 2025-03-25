import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/screens/login/widgets/bottom_header/login_generate_user.dart';
import 'package:flutter_base_project/ui/screens/login/widgets/bottom_header/login_generate_user_divider.dart';

class LoginBottomHeader extends StatelessWidget {
  const LoginBottomHeader({super.key, required this.onGenerateUserPressed});

  final void Function() onGenerateUserPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginGenerateUserDivider(),
        LoginGenerateUser(onGenerateUserPressed: onGenerateUserPressed),
      ],
    );
  }
}
