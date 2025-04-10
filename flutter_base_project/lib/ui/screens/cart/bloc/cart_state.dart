import 'package:flutter_base_project/base/state_management/copyable.dart';
import 'package:flutter_base_project/domain/models/cart/cart.dart';

class CartState implements Copyable<CartState> {
  const CartState({this.cart});

  final Cart? cart;

  @override
  CartState copy() {
    return CartState(
      cart: cart,
    );
  }

  @override
  CartState copyWith({
    Cart? cart,
  }) {
    return CartState(
      cart: cart ?? this.cart,
    );
  }
}
