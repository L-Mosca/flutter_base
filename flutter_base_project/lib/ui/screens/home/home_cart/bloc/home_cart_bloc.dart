import 'package:flutter_base_project/base/state_management/base_bloc.dart';
import 'package:flutter_base_project/domain/repositories/cart_repository.dart';
import 'package:flutter_base_project/ui/screens/home/home_cart/bloc/home_cart_event.dart';
import 'package:flutter_base_project/ui/screens/home/home_cart/bloc/home_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCartBloc extends BaseBloc<HomeCartEvent, HomeCartState> {
  final CartRepository cartRepository;

  HomeCartBloc({required this.cartRepository}) : super(const HomeCartState()) {
    on<HomeCartInitEvent>(_init);
    on<HomeCartFetchCartEvent>(_fetchCart);
  }

  void _init(HomeCartInitEvent event, Emitter<HomeCartState> emitter) async {
    await defaultLaunch(
      function: () async {
        final cart = await cartRepository.getCart();
        emitter(state.copyWith(cart: cart));
      },
    );
  }

  void _fetchCart(
    HomeCartFetchCartEvent event,
    Emitter<HomeCartState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        final cart = await cartRepository.getCart();
        emitter(state.copyWith(cart: cart));
      },
    );
  }
}
