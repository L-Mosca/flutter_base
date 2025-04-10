import 'package:flutter_base_project/base/state_management/base_bloc.dart';
import 'package:flutter_base_project/domain/repositories/cart_repository.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_event.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends BaseBloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(const CartState()) {
    on<CartInitEvent>(_init);
    on<CartCheckOutEvent>(_checkOut);
  }

  void _init(
    CartInitEvent event,
    Emitter<CartState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {},
      exceptionHandler: (exception) {},
    );
  }

  void _checkOut(CartCheckOutEvent event, Emitter<CartState> emitter) async {
    await defaultLaunch(
      function: () async {},
      exceptionHandler: (exception) {},
      loadingStatus: (isLoading) {},
    );
  }
}
