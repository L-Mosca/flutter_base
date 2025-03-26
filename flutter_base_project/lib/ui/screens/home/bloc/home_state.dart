import 'package:flutter_base_project/base/state_management/copyable.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';

class HomeState implements Copyable<HomeState> {
  const HomeState({
    this.products = const [],
    this.showLoading = false,
  });

  final List<Product> products;
  final bool showLoading;

  @override
  HomeState copy() {
    return HomeState(
      products: products,
      showLoading: showLoading,
    );
  }

  @override
  HomeState copyWith({
    List<Product>? products,
    bool? showLoading,
  }) {
    return HomeState(
      products: products ?? this.products,
      showLoading: showLoading ?? this.showLoading,
    );
  }

  HomeState loadProducts(List<Product> list) => copyWith(products: list);

  HomeState isLoading(bool isLoading) => copyWith(showLoading: isLoading);
}
