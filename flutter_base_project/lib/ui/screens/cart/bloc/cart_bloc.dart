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
    on<CartSumProductEvent>(_sumProduct);
    on<CartMinusProductEvent>(_removeProduct);
    on<CartResetListenerEvent>(_resetListener);
  }

  void _init(
    CartInitEvent event,
    Emitter<CartState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        final cart = await cartRepository.getCart();
        emitter(state.copyWith(cart: cart));
      },
      exceptionHandler: (exception) {},
    );
  }

  void _checkOut(CartCheckOutEvent event, Emitter<CartState> emitter) async {
    await defaultLaunch(
      function: () async {
        final cart = state.cart;
        if (cart != null) {
          await cartRepository.checkOut(cart: cart);
          emitter(state.checkOutSuccess);
        }
      },
      exceptionHandler: (exception) {},
      loadingStatus: (isLoading) {},
    );
  }

  void _sumProduct(
    CartSumProductEvent event,
    Emitter<CartState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        final product = event.product;
        final newCart = await cartRepository.addProduct(product: product);
        emitter(state.copyWith(cart: newCart));
      },
    );
  }

  void _removeProduct(
    CartMinusProductEvent event,
    Emitter<CartState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        final product = event.product;
        final newCart = await cartRepository.removeProduct(product: product);
        emitter(state.copyWith(cart: newCart));
      },
    );
  }

  void _resetListener(
    CartResetListenerEvent event,
    Emitter<CartState> emitter,
  ) async {
    emitter(state.resetListener);
  }
}
