import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/di/injector.dart';
import 'package:flutter_base_project/domain/repositories/cart_repository.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter_base_project/ui/screens/cart/bloc/cart_event.dart';
import 'package:flutter_base_project/ui/screens/cart/cart_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartRouter {
  const CartRouter._();

  static Widget get page => BlocProvider(
        create: (_) => CartBloc(
          cartRepository: injector.get<CartRepository>(),
        )..add(CartInitEvent()),
        child: CartPage(),
      );
}
