import 'package:flutter_base_project/base/state_management/copyable.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';

enum HomeStatus { initial }

class HomeState implements Copyable<HomeState> {
  const HomeState({
    this.status = HomeStatus.initial,
    this.products = const [],
  });

  final HomeStatus status;
  final List<Product> products;

  @override
  HomeState copy() {
    return HomeState(
      status: status,
      products: products,
    );
  }

  @override
  HomeState copyWith({
    HomeStatus? status,
    List<Product>? products,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  HomeState loadProducts(List<Product> list) => copyWith(products: list);
}
