import 'package:flutter/material.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_event.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_state.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/cart_check_out_button.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/cart_content.dart';
import 'package:flutter_base_project/ui/screens/cart/widgets/cart_page_app_bar.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_line.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<CartBloc, CartEvent, CartState>(
      listener: _onChange,
      builder: _pageContent,
    );
  }

  void _onChange(BuildContext context, CartState state) {
    _checkoutSuccess(context, state);
    _emptyCard(context, state);
  }

  Widget _pageContent(BuildContext context, CartState state) {
    return SafeArea(
      child: Scaffold(
        appBar: CartPageAppBar(onBackPressed: () => Navigator.pop(context)),
        body: Column(
          children: [
            BaseLine(),
            CartContent(
              state: state,
              onNewProductPressed: (data) => _newProduct(context, data),
              onMinusProductPressed: (data) => _removeProduct(context, data),
            ),
            CartCheckOutButton(
              onCheckOutPressed: () => _onCheckOutPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  void _newProduct(BuildContext context, Product product) {
    context.read<CartBloc>().add(CartSumProductEvent(product: product));
  }

  void _removeProduct(BuildContext context, Product product) {
    context.read<CartBloc>().add(CartMinusProductEvent(product: product));
  }

  void _onCheckOutPressed(BuildContext context) =>
      context.read<CartBloc>().add(CartCheckOutEvent());

  void _checkoutSuccess(BuildContext context, CartState state) {
    if (state.listener == CartListener.checkOutSuccess) {
      Navigator.pop(context);
      context.read<CartBloc>().add(CartResetListenerEvent());
    }
  }

  void _emptyCard(BuildContext context, CartState state) {
    if (state.listener == CartListener.emptyCard) {
      Navigator.pop(context);
      context.read<CartBloc>().add(CartResetListenerEvent());
    }
  }
}
