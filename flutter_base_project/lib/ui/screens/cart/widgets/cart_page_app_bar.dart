import 'package:flutter/material.dart';
import 'package:flutter_base_project/localization/delegate/localization_extensions.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_app_bar.dart';

class CartPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartPageAppBar({super.key, required this.onBackPressed});

  final void Function() onBackPressed;

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      title: context.strings.cart,
      onBackPressed: onBackPressed,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
