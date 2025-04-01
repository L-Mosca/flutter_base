import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/loading/base_shimmer.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: _gridDelegate,
      itemCount: 20,
      padding: const EdgeInsets.all(AppSizes.marginSmall),
      itemBuilder: (context, index) => BaseShimmer(
        height: 330.0,
        borderRadius: AppSizes.radiusSmall,
      ),
    );
  }

  SliverGridDelegate get _gridDelegate =>
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        mainAxisExtent: 330.0,
      );
}
