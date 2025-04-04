import 'package:flutter_base_project/base/state_management/copyable.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';

enum HomeListener { nothing, logoutSuccess }

class HomeState implements Copyable<HomeState> {
  const HomeState({
    this.listener = HomeListener.nothing,
    this.products = const [],
    this.showLoading = false,
  });

  final HomeListener listener;
  final List<Product> products;
  final bool showLoading;

  @override
  HomeState copy() {
    return HomeState(
      listener: listener,
      products: products,
      showLoading: showLoading,
    );
  }

  @override
  HomeState copyWith({
    HomeListener? listener,
    List<Product>? products,
    bool? showLoading,
  }) {
    return HomeState(
      listener: listener ?? this.listener,
      products: products ?? this.products,
      showLoading: showLoading ?? this.showLoading,
    );
  }

  HomeState loadProducts(List<Product> list) => copyWith(products: list);

  HomeState isLoading(bool isLoading) => copyWith(showLoading: isLoading);

  HomeState get logoutSuccess => copyWith(listener: HomeListener.logoutSuccess);

  HomeState get resetListener => copyWith(listener: HomeListener.nothing);
}
