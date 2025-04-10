import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_event.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_state.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<CartBloc, CartEvent, CartState>(
      listener: _onChange,
      builder: _pageContent,
    );
  }

  void _onChange(BuildContext context, CartState state) {}

  Widget _pageContent(BuildContext context, CartState state) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
      ),
    );
  }
}
