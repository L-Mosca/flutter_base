import 'package:flutter_base_project/domain/models/product/product.dart';

abstract class CartEvent {}

class CartInitEvent extends CartEvent {}

class CartCheckOutEvent extends CartEvent {}

class CartSumProductEvent extends CartEvent {
  final Product product;

  CartSumProductEvent({required this.product});
}

class CartMinusProductEvent extends CartEvent {
  final Product product;

  CartMinusProductEvent({required this.product});
}

class CartResetListenerEvent extends CartEvent {}
