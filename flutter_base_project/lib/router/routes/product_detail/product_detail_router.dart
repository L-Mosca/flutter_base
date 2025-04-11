import 'package:flutter/material.dart';
import 'package:flutter_base_project/di/injector.dart';
import 'package:flutter_base_project/domain/repositories/cart_repository.dart';
import 'package:flutter_base_project/domain/repositories/product_repository.dart';
import 'package:flutter_base_project/router/app_router.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_bloc.dart';
import 'package:flutter_base_project/ui/screens/product_detail/bloc/product_detail_event.dart';
import 'package:flutter_base_project/ui/screens/product_detail/product_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailRouter {
  ProductDetailRouter._();

  static Widget page(BuildContext context, RouteSettings routeSettings) {
    final args = routeSettings.arguments as Map<String, dynamic>?;
    final productId = args?[AppRouter.productDetailIdArgument] as int? ?? -1;

    return BlocProvider(
      create: (context) => ProductDetailBloc(
        productRepository: injector.get<ProductRepository>(),
        cartRepository: injector.get<CartRepository>(),
      )..add(ProductDetailInitEvent(productId: productId)),
      child: const ProductDetailPage(),
    );
  }
}
