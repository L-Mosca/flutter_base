import 'package:flutter_base_project/base/state_management/copyable.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';

class ProductDetailState implements Copyable<ProductDetailState> {
  const ProductDetailState({
    this.productId = -1,
    this.product,
    this.showLoading = false,
    this.showErrorPlaceholder = false,
  });

  final int productId;
  final Product? product;
  final bool showLoading;
  final bool showErrorPlaceholder;

  @override
  ProductDetailState copy() {
    return ProductDetailState(
      productId: productId,
      product: product,
      showLoading: showLoading,
      showErrorPlaceholder: showErrorPlaceholder,
    );
  }

  @override
  ProductDetailState copyWith({
    int? productId,
    Product? product,
    bool? showLoading,
    bool? showErrorPlaceholder,
  }) {
    return ProductDetailState(
      productId: productId ?? this.productId,
      product: product ?? this.product,
      showLoading: showLoading ?? this.showLoading,
      showErrorPlaceholder: showErrorPlaceholder ?? this.showErrorPlaceholder,
    );
  }

  ProductDetailState isLoading(bool isLoading) => copyWith(
        showLoading: isLoading,
      );

  ProductDetailState showError(bool isError) => copyWith(
        showLoading: !isError,
        showErrorPlaceholder: isError,
      );

  ProductDetailState loadProduct(Product productDetail) => copyWith(
        product: productDetail,
        showLoading: false,
        showErrorPlaceholder: false,
      );
}
