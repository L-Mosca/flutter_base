import 'package:flutter_base_project/base/state_management/copyable.dart';
import 'package:flutter_base_project/domain/models/cart/cart.dart' show Cart;

class HomeCartState implements Copyable<HomeCartState> {
  const HomeCartState({this.cart});

  final Cart? cart;

  @override
  HomeCartState copy() {
    return HomeCartState(cart: cart);
  }

  @override
  HomeCartState copyWith({Cart? cart}) {
    return HomeCartState(cart: cart ?? this.cart);
  }
}
