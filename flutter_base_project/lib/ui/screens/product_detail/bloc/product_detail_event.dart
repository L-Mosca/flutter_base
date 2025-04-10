abstract class ProductDetailEvent {}

class ProductDetailInitEvent extends ProductDetailEvent {
  final int productId;

  ProductDetailInitEvent({required this.productId});
}

class ProductDetailReloadEvent extends ProductDetailEvent {}

class ProductDetailAddToCartEvent extends ProductDetailEvent {}

class ProductDetailResetListenerEvent extends ProductDetailEvent {}
