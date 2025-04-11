import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/di/injector.dart';
import 'package:flutter_base_project/domain/repositories/cart_repository.dart';
import 'package:flutter_base_project/domain/repositories/product_repository.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_bloc.dart';
import 'package:flutter_base_project/ui/screens/home/bloc/home_event.dart';
import 'package:flutter_base_project/ui/screens/home/home_cart/bloc/home_cart_bloc.dart';
import 'package:flutter_base_project/ui/screens/home/home_cart/bloc/home_cart_event.dart';
import 'package:flutter_base_project/ui/screens/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRouter {
  const HomeRouter._();

  static Widget get page => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => _homeBloc),
          BlocProvider(create: (_) => _homeCartBloc),
        ],
        child: const HomePage(),
      );
}

HomeBloc get _homeBloc => HomeBloc(
      productRepository: injector.get<ProductRepository>(),
      userRepository: injector.get<UserRepository>(),
    )..add(HomeInitEvent());

HomeCartBloc get _homeCartBloc =>
    HomeCartBloc(cartRepository: injector.get<CartRepository>())
      ..add(HomeCartInitEvent());
