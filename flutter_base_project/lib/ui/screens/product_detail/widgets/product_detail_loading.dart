import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/loading/base_shimmer.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class ProductDetailLoading extends StatelessWidget {
  const ProductDetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _imageShimmer(),
        _titleShimmer(),
        _descriptionShimmer(),
        _starShimmer(),
        _priceShimmer(),
        Spacer(),
        _buttonShimmer(),
      ],
    );
  }

  Widget _imageShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
      child: BaseShimmer(
        borderRadius: AppSizes.radiusMini,
        width: double.infinity,
        height: 200,
      ),
    );
  }

  Widget _titleShimmer() {
    return Container(
      margin: const EdgeInsets.only(
        top: AppSizes.marginMini,
        left: AppSizes.marginMedium,
        right: AppSizes.marginMedium,
      ),
      width: double.infinity,
      child: BaseShimmer(width: double.infinity, height: 30.0),
    );
  }

  Widget _descriptionShimmer() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppSizes.marginSmall,
        horizontal: AppSizes.marginMedium,
      ),
      child: BaseShimmer(width: double.infinity, height: 120.0),
    );
  }

  Widget _starShimmer() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(
          left: AppSizes.marginMedium,
          top: AppSizes.marginSmall,
        ),
        child: BaseShimmer(width: 120.0, height: 24.0),
      ),
    );
  }

  Widget _priceShimmer() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(
          left: AppSizes.marginMedium,
          right: AppSizes.marginMedium,
          top: AppSizes.marginMedium,
        ),
        child: BaseShimmer(width: 100.0, height: 30.0),
      ),
    );
  }

  Widget _buttonShimmer() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: AppSizes.marginMedium,
      ),
      child: BaseShimmer(
        width: double.infinity,
        height: 54.0,
        borderRadius: AppSizes.radiusMini,
      ),
    );
  }
}
