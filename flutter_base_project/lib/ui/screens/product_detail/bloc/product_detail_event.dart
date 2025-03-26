abstract class ProductDetailEvent {}

class ProductDetailInitEvent extends ProductDetailEvent {
  final int? productId;

  ProductDetailInitEvent({required this.productId});
}

class ProductDetailReloadEvent extends ProductDetailEvent {}
