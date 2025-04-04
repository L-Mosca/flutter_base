import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_app_bar.dart';

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
    return BaseAppBar(title: title ?? "", onBackPressed: onBackPressed);
  }
}
