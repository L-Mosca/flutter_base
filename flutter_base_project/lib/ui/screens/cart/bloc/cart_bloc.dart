import 'package:flutter_base_project/base/state_management/base_bloc.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_event.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends BaseBloc<CartEvent, CartState> {

  CartBloc() : super(const CartState()) {
    on<CartInitEvent>(_init);
  }

  void _init(
    CartInitEvent event,
    Emitter<CartState> emitter,
  ) async {}
}
