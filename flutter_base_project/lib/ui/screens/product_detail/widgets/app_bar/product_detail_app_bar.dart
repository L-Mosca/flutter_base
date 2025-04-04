import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class ProductDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailAppBar({
    super.key,
    this.title,
    required this.onBackPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final String? title;
  final void Function() onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.background,
      centerTitle: false,
      title: _title(),
      scrolledUnderElevation: 0.0,
      elevation: 0.0,
      leading: _backButton(context),
      titleSpacing: 0.0,
    );
  }

  Widget _title() {
    if (title == null || title?.isEmpty == true) return const SizedBox();

    return Container(
      margin: EdgeInsets.only(right: AppSizes.marginSmall),
      child: BaseText(
        text: title!,
        fontWeight: FontWeight.w700,
        fontSize: AppSizes.fontLarge,
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return Material(
      color: context.colors.background,
      child: GestureDetector(
        onTap: onBackPressed,
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 24,
          color: AppColors.blueDark400,
        ),
      ),
    );
  }
}
