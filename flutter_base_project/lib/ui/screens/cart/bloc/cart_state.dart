import 'package:flutter_base_project/base/state_management/copyable.dart';
import 'package:flutter_base_project/domain/models/cart/cart.dart';

enum CartListener { nothing, checkOutSuccess }

class CartState implements Copyable<CartState> {
  const CartState({
    this.listener = CartListener.nothing,
    this.cart,
  });

  final CartListener listener;
  final Cart? cart;

  @override
  CartState copy() {
    return CartState(
      listener: listener,
      cart: cart,
    );
  }

  @override
  CartState copyWith({
    CartListener? listener,
    Cart? cart,
  }) {
    return CartState(
      listener: listener ?? this.listener,
      cart: cart ?? this.cart,
    );
  }

  CartState get checkOutSuccess => copyWith(
        listener: CartListener.checkOutSuccess,
      );

  CartState get resetListener => copyWith(listener: CartListener.nothing);
}
