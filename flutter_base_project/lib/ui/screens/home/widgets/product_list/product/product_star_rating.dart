import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/star_rating.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class ProductStarRating extends StatelessWidget {
  const ProductStarRating({super.key, this.rate});

  final double? rate;

  @override
  Widget build(BuildContext context) {
    if (rate == null) return const SizedBox();

    return Container(
      margin: _margin,
      child: Align(
        alignment: Alignment.centerLeft,
        child: StarRating(rating: rate!),
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.only(
        left: AppSizes.marginMedium,
        top: AppSizes.marginSmall,
      );
}
