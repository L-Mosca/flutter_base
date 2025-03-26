import 'package:flutter/material.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 40.0,
        height: 40.0,
        child: CircularProgressIndicator(color: AppColors.accent),
      ),
    );
  }
}
