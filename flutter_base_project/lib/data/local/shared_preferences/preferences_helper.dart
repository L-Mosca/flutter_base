import 'package:flutter_base_project/domain/models/cart/cart.dart';
import 'package:flutter_base_project/domain/models/payment/credit_card.dart';
import 'package:flutter_base_project/domain/models/product/product.dart';

abstract interface class PreferencesHelper {
  // User
  Future<void> saveUserToken({required String token});
  Future<String?> getUserToken();

  // Cart
  Future<Cart> getCart();
  Future<void> createCart({required Cart cart});
  Future<void> deleteCart();
  Future<Cart> updateCart({required Cart cart});

  // Product
  Future<void> addProduct({required Product product});
  Future<void> deleteProduct({required Product product});

  // Payment
  Future<void> addPayment();
  Future<void> deletePayment();

  // Cards
  Future<List<CreditCard>> getCards();
  Future<void> addCard({required CreditCard card});
  Future<void> deleteCard({required CreditCard card});
}