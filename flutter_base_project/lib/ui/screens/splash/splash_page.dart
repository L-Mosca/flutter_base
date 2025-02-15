import 'package:flutter/material.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/login");
          },
          child: Container(color: AppColors.error),
        ),
      ),
    );
  }
}
