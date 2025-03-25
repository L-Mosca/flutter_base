import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/screens/login/widgets/top_header/login_top_header_icon.dart';
import 'package:flutter_base_project/ui/screens/login/widgets/top_header/login_top_header_message.dart';
import 'package:flutter_base_project/ui/screens/login/widgets/top_header/login_top_header_title.dart';

class LoginTopHeader extends StatelessWidget {
  const LoginTopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginTopHeaderIcon(),
        LoginTopHeaderTitle(),
        LoginTopHeaderMessage(),
      ],
    );
  }
}
