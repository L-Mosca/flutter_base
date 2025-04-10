import 'package:flutter_base_project/base/state_management/copyable.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';

enum ProductDetailStatus { initial, loading, error }

enum ProductDetailListener { nothing, addToCartSuccess }

class ProductDetailState implements Copyable<ProductDetailState> {
  const ProductDetailState({
    this.listener = ProductDetailListener.nothing,
    this.status = ProductDetailStatus.initial,
    this.productId = -1,
    this.product,
  });

  final ProductDetailListener listener;
  final ProductDetailStatus status;
  final int productId;
  final Product? product;

  @override
  ProductDetailState copy() {
    return ProductDetailState(
      listener: listener,
      status: status,
      productId: productId,
      product: product,
    );
  }

  @override
  ProductDetailState copyWith({
    ProductDetailListener? listener,
    ProductDetailStatus? status,
    int? productId,
    Product? product,
  }) {
    return ProductDetailState(
      listener: listener ?? this.listener,
      status: status ?? this.status,
      productId: productId ?? this.productId,
      product: product ?? this.product,
    );
  }

  ProductDetailState isLoading(bool isLoading) {
    ProductDetailStatus newStatus = status;
    if (isLoading) {
      newStatus = ProductDetailStatus.loading;
    } else {
      newStatus = ProductDetailStatus.initial;
    }

    return copyWith(status: newStatus);
  }

  ProductDetailState showError(bool isError) {
    ProductDetailStatus newStatus = status;
    if (isError) {
      newStatus = ProductDetailStatus.error;
    } else {
      newStatus = ProductDetailStatus.initial;
    }
    return copyWith(status: newStatus);
  }

  ProductDetailState loadProduct(Product productDetail) => copyWith(
        product: productDetail,
        status: ProductDetailStatus.initial,
      );

  ProductDetailState get addToCardSuccess => copyWith(
        listener: ProductDetailListener.addToCartSuccess,
      );

  ProductDetailState get resetListener => copyWith(
        listener: ProductDetailListener.nothing,
      );
}
