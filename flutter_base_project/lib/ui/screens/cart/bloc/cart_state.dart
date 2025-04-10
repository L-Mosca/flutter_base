import 'package:flutter_base_project/base/state_management/copyable.dart';

class CartState implements Copyable<CartState> {
  const CartState();


  @override
  CartState copy() {
    return CartState();
  }

  @override
  CartState copyWith() {
    return CartState();
  }
}